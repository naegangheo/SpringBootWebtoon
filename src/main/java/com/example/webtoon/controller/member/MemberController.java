package com.example.webtoon.controller.member;


import com.example.webtoon.dto.MemberVO;
import com.example.webtoon.service.member.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class MemberController {
    @Autowired
    MemberService ms;

    @GetMapping("/join")
    public String join() {
        return "member/join";
    }

    @GetMapping("/agree")
    public String agree() {
        return "member/agree";
    }

    @PostMapping("/member")
    public String addMember(@ModelAttribute("dto") @Valid MemberVO mvo, BindingResult result, Model model, HttpServletRequest request) {
        // 회원 정보 저장
        ms.insertMember(mvo); // 데이터베이스에 회원 정보 저장
        // 성공후 페이지 설정
        HttpSession session = request.getSession();
        session.setAttribute("loginUser", mvo);
        return "member/joinFinish"; //가입완료 페이지로 이동
    }

    @GetMapping("/start")
    public String start() {
        return "redirect:/";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, HttpServletRequest request, Model model) {
        String url = "member/login";
        MemberVO mvo = ms.getMember(membervo.getUserid());
        if (mvo != null && mvo.getPwd().equals(membervo.getPwd())) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", mvo);
            url = "redirect:/";
        } else {
            model.addAttribute("message", "아이디 또는 비밀번호를 확인하세요");
        }
        return url;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginUser");
        return "redirect:/";
    }

    @GetMapping("/updateMember")
    public String updateMember(HttpSession session, Model model) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        model.addAttribute("loginUser", loginUser);
        return "member/updateMember";
    }

    @PostMapping("/updateMember")
    public String editMember(HttpSession session, @ModelAttribute MemberVO mvo, Model model, @RequestParam String currentPwd) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser != null) {

            // 저장된 비밀번호와 입력된 비밀번호 비교
            if (!loginUser.getPwd().equals(currentPwd)) {
                model.addAttribute("errorMessage", "현재 비밀번호가 일치하지 않습니다.");
                model.addAttribute("loginUser", loginUser);
                return "member/updateMember"; // 다시 수정 화면으로
            }

            // 비밀번호가 일치하면 업데이트 진행
            mvo.setUserid(loginUser.getUserid());
            ms.updateMember(mvo);

            // 세션에 업데이트 한 사용자 정보 저장
            MemberVO updateUser = ms.getMember(loginUser.getUserid());
            session.setAttribute("loginUser", updateUser);
            model.addAttribute("loginUser", updateUser);
        }
        return "member/updateMember";
    }

    @PostMapping("/updatePwd")
    public ResponseEntity<?> updatePwd(@RequestBody Map<String, String> requestData, HttpSession session) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        String currentPwd = requestData.get("currentPwd");
        String newPwd = requestData.get("newPwd");

        if (currentPwd == null || newPwd == null || !loginUser.getPwd().equals(currentPwd)) {
            return ResponseEntity.badRequest()
                    .body(Map.of("success", false, "message", "현재 비밀번호가 올바르지 않습니다."));
        }

        // 비밀번호 업데이트
        loginUser.setPwd(newPwd);
        ms.updateMember(loginUser);

        return ResponseEntity.ok(Map.of("success", true, "message", "비밀번호가 성공적으로 변경되었습니다."));
    }


}
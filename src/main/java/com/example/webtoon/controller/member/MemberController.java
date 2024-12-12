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

import java.util.HashMap;
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
    @ResponseBody
    public Map<String, Object> addMember(@ModelAttribute @Valid MemberVO memberVO, BindingResult result, HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        if (result.hasErrors()) {
            result.getAllErrors().forEach(error -> {
                System.out.println("Validation Error: " + error.getDefaultMessage());
            });
            response.put("success", false);
            response.put("message", "유효하지 않은 입력값이 있습니다.");
            return response;
        }

        try {
            ms.insertMember(memberVO);

            session.setAttribute("loginUser", memberVO);

            response.put("success", true);
            response.put("redirectUrl", "/joinFinish");
        } catch (RuntimeException e) {
            System.err.println("Error in addMember: " + e.getMessage());
            response.put("success", false);
            response.put("message", e.getMessage());
        }
        return response;
    }

    @GetMapping("/member/checkUserid")
    @ResponseBody
    public Map<String, Object> checkUserid(@RequestParam("userid") String userid) {
        Map<String, Object> response = new HashMap<>();

        try {
            MemberVO member = ms.getMember(userid);
            if (member != null) {
                response.put("available", false);
                response.put("message", "이미 사용중인 아이디입니다.");
            } else {
                response.put("available", true);
                response.put("message", "사용 가능한 아이디입니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("available", false);
            response.put("message", "아이디 중복 확인 중 문제가 발생했습니다.");
        }
        return response;
    }

    @GetMapping("/joinFinish")
    public String joinFinish() {
        return "member/joinFinish";
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
    @ResponseBody
    public Map<String, Object> login(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();

        if (result.hasErrors()) {
            result.getAllErrors().forEach(error -> {
                System.out.println("Validation Error: " + error.getObjectName() + " - " + error.getDefaultMessage());
            });
            response.put("success", false);
            response.put("message", "유효하지 않은 입력값이 있습니다.");
            return response;
        }

        MemberVO mvo = ms.getMember(membervo.getUserid());
        if (mvo != null && mvo.getPwd().equals(membervo.getPwd())) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", mvo);

            response.put("success", true);
            response.put("redirectUrl", "/");
        } else {
            response.put("success", false);
            response.put("message", "아이디 또는 비밀번호를 확인하세요.");
        }
        return response;
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

           if (!loginUser.getPwd().equals(currentPwd)) {
                model.addAttribute("errorMessage", "현재 비밀번호가 일치하지 않습니다.");
                model.addAttribute("loginUser", loginUser);
                return "member/updateMember";
            }

            mvo.setUserid(loginUser.getUserid());
            ms.updateMember(mvo);

            MemberVO updateUser = ms.getMember(loginUser.getUserid());
            session.setAttribute("loginUser", updateUser);
            model.addAttribute("loginUser", updateUser);
            model.addAttribute("successMessage", "회원 정보가 성공적으로 수정되었습니다.");
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
        loginUser.setPwd(newPwd);
        ms.updateMember(loginUser);

        return ResponseEntity.ok(Map.of("success", true, "message", "비밀번호가 성공적으로 변경되었습니다."));
    }

    @GetMapping("/deleteMember")
        public String deleteMemberPage(HttpSession session, Model model) {
        return "/member/deleteMember"; }

    @PostMapping("/deleteMember")
    @ResponseBody
    public ResponseEntity<?> deleteMember(HttpSession session, @RequestBody Map<String, String> requestData) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }
        String confirmPassword = requestData.get("password");

        if (confirmPassword == null || !loginUser.getPwd().equals(confirmPassword)) {
            return ResponseEntity.badRequest()
                    .body(Map.of("success", false, "message", "비밀번호가 일치하지 않습니다."));
        }

        try {
            ms.deleteMember(loginUser.getUserid());
            session.removeAttribute("loginUser");

            return ResponseEntity.ok(Map.of("success", true, "message", "회원 탈퇴가 완료되었습니다."));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false, "message", "회원 탈퇴 중 오류가 발생했습니다."));
        }
    }
}
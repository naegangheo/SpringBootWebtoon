package com.example.webtoon.controller.member;

import com.example.webtoon.dto.member.MemberVO;
import com.example.webtoon.service.member.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {@Autowired
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
    public String logout( HttpSession session ) {
        session.removeAttribute("loginUser");
        return "redirect:/";
    }
}

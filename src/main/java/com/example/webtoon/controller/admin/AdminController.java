package com.example.webtoon.controller.admin;

import com.example.webtoon.dto.*;
import com.example.webtoon.service.admin.AdminService;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {

    @Autowired
    AdminService ads;

    @GetMapping("/adminLogin")
    public String adminLogin() {  return "admin/admin_login"; }

    @PostMapping("/adminLogin")
    @ResponseBody
    public Map<String, Object> adminLogin(@ModelAttribute("dto") @Valid AdminVO adminvo, BindingResult result, HttpServletRequest request) {

        Map<String, Object> response = new HashMap<>();

        if (result.hasErrors()) {
            result.getAllErrors().forEach(error -> {
                System.out.println("Validation Error: " + error.getObjectName() + " - " + error.getDefaultMessage());
            });
            response.put("success", false);
            response.put("message", "유효하지 않은 입력값이 있습니다.");
            return response;
        }

        AdminVO advo = ads.getAdmin(adminvo.getAdminid());
        if (advo != null && advo.getPwd().equals(adminvo.getPwd())) {
            HttpSession session = request.getSession();
            session.setAttribute("loginAdmin", advo);

            response.put("success", true);
            response.put("redirectUrl", "/admin");
        } else {
            response.put("success", false);
            response.put("message", "아이디 또는 비밀번호를 확인하세요.");
        }
        return response;
    }


    @GetMapping("/admin")
    public ModelAndView admin(Model model) {
        ModelAndView mav = new ModelAndView();
        List<WebtoonVO> webtoon = ads.adSelectWebtoon();
        model.addAttribute("webtoon", webtoon);
        mav.setViewName("admin/admin_main");

        return mav;
    }

    @GetMapping("/adminQnalist")
    public ModelAndView adminQnalist(Model model) {

        ModelAndView mav = new ModelAndView();
        List<QnaVO> qna = ads.adSelectQna();
        model.addAttribute("qna", qna);
        mav.setViewName("admin/admin_qnalist");

        return mav;
    }

    @GetMapping("/adminNoticelist")
    public ModelAndView adminNoticelist(Model model) {

        ModelAndView mav = new ModelAndView();
        List<NoticeVO> notice = ads.adSelectNotice();
        model.addAttribute("notice", notice);
        mav.setViewName("admin/admin_noticelist");

        return mav;
    }

}
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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
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

//========webtoonList==================================

    @GetMapping("/admin")
    public ModelAndView admin(HttpServletRequest request, Model model) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ads.adSelectWebtoon(request);
        int mCount= ads.adAllCountMember();
        int wCount = ads.adAllCountWebtoon();

        model.addAttribute("webtoonCount", wCount);
        model.addAttribute("memberCount", mCount);
        mav.addObject("adSelectWebtoon", result.get("adSelectWebtoon"));
        mav.addObject("paging", result.get("paging"));
        mav.setViewName("admin/webtoon/admin_webtoonlist");

        return mav;
    }

    @GetMapping("/adminWebtoonDelete")
    public String adminWebtoonDelete(@RequestParam("wseq") int wseq) {
        ads.adminWebtoonDelete(wseq);

        return "redirect:/admin";
    }

    @GetMapping("/adminWebtoonUpdate")
    public ModelAndView adminWebtoonUpdate(@RequestParam("wseq") int wseq, Model model) {

        ModelAndView mav = new ModelAndView();
        WebtoonVO wvo = ads.adGetWebtoon(wseq);

        mav.addObject("webtoon", wvo);
        mav.setViewName("admin/webtoon/admin_webtoon_update");

        return mav;

    }


//========Q&AList=====================================

    @GetMapping("adminQnaWriteForm")
    public String adminQnaWriteForm(HttpServletRequest request, Model model) {


        return "admin/qna/qna_insert";
    }

    @GetMapping("/adminQnalist")
    public ModelAndView adminQnalist(HttpServletRequest request, Model model) {

        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ads.adSelectQna(request);
        int mCount= ads.adAllCountMember();
        int wCount = ads.adAllCountWebtoon();

        model.addAttribute("webtoonCount", wCount);
        model.addAttribute("memberCount", mCount);
        mav.addObject("adSelectQna", result.get("adSelectQna"));
        mav.addObject("paging", result.get("paging"));
        mav.setViewName("admin/qna/admin_qnalist");


        return mav;
    }



//========NoticeList==================================



    @GetMapping("/adminNoticelist")
    public ModelAndView adminNoticelist(HttpServletRequest request,Model model) {

        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ads.adSelectNotice(request);
        int mCount= ads.adAllCountMember();
        int wCount = ads.adAllCountWebtoon();

        model.addAttribute("webtoonCount", wCount);
        model.addAttribute("memberCount", mCount);
        mav.addObject("adSelectNotice", result.get("adSelectNotice"));
        mav.addObject("paging", result.get("paging"));
        mav.setViewName("admin/notice/admin_noticelist");

        return mav;

    }

    @GetMapping("adminNoticeWriteForm")
    public String adminNoticeWriteForm(HttpServletRequest request, Model model) {
        return "admin/notice/notice_insert";
    }

    @PostMapping("/adminNoticeWrite")
    public String adminNoticeWrite(@ModelAttribute("dto") @Valid NoticeVO noticevo, BindingResult result,
                                   HttpSession session, Model model) {

        String url="admin/notice/notice_insert";

        AdminVO adminLogin=(AdminVO)session.getAttribute("loginAdmin");
        model.addAttribute("adminLogin", adminLogin);
        if(adminLogin==null){
            return "redirect:/admin/admin_login";
        }

        if(result.getFieldError("adminid")!=null){
            model.addAttribute("message",result.getFieldError("adminid").getDefaultMessage());
        } else if(result.getFieldError("pwd")!=null){
            model.addAttribute("message",result.getFieldError("pwd").getDefaultMessage());
        } else if(result.getFieldError("subject")!=null){
            model.addAttribute("message",result.getFieldError("subject").getDefaultMessage());
        }else if(result.getFieldError("content")!=null){
            model.addAttribute("message",result.getFieldError("content").getDefaultMessage());
        } else{
            ads.insertNotice(noticevo);
             return url="redirect:/adminNoticelist";
        }
        return url;

    }

    @GetMapping("/adminNoticeUpdateForm")
    public ModelAndView adminNoticeUpdate(@RequestParam("nseq") int nseq, HttpServletRequest request, Model model) {
        System.out.println("nseq: " + nseq);
        ModelAndView mav = new ModelAndView();
        NoticeVO nvo = ads.getNoticeUpdate(nseq);
        if (nvo == null) {
            System.out.println("공지사항을 찾을 수 없습니다.");
        } else {
            System.out.println("조회된 공지사항: " + nvo);
        }
        mav.addObject("nvo", nvo);
        mav.setViewName("admin/notice/notice_update");

        return mav;

    }

    @PostMapping("/adminNoticeUpdate")
    public String adminNoticeUpdate(@ModelAttribute("nvo") @Valid NoticeVO noticevo, BindingResult result, Model model){
        String url="admin/notice/notice_update";

        NoticeVO nvo = ads.getNoticeUpdate(noticevo.getNseq());
        System.out.println("nseq1:"+noticevo.getNseq());
        System.out.println("조회된 공지사항 nvo: " + nvo);  // nvo 값 확인
        if(!nvo.getPwd().equals(noticevo.getPwd())){
            model.addAttribute("message","수정 비밀 번호가 맞지 않음");
        }else if(result.getFieldError("pwd")!=null){
            model.addAttribute("message",result.getFieldError("pwd").getDefaultMessage());
        }else if(result.getFieldError("subject")!=null){
            model.addAttribute("message",result.getFieldError("subject").getDefaultMessage());
        }else if(result.getFieldError("content")!=null){
            model.addAttribute("message",result.getFieldError("content").getDefaultMessage());
        }else{
            ads.updateNotice(noticevo);
            url="redirect:/adminNoticelist";
        }
        return url;
    }

    @GetMapping("/adminNoticeDelete")
    public String adminNoticeDelete(@RequestParam("nseq") int nseq) {
        ads.adminNoticeDelete(nseq);
        return "redirect:/adminNoticelist";
    }





}

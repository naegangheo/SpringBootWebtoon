package com.example.webtoon.controller.admin;

import com.example.webtoon.dto.*;
import com.example.webtoon.service.admin.AdminService;
import jakarta.servlet.ServletContext;
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

    @PostMapping("/updateWebtoon")
    public String updateWebtoon(@ModelAttribute("webtoon") @Valid WebtoonVO webtoonvo, BindingResult result, HttpServletRequest request,Model model) {
        String url = "redirect:/admin";
        if (result.getFieldError("subject")!=null) {
            model.addAttribute("message","제목을 입력하세요");
        }else if(result.getFieldError("content")!=null) {
            model.addAttribute("message","내용을 입력하세요");
        } else{
            ads.adminUpdateWebtoon(webtoonvo);
        }

        return url;
    }


    @PostMapping("/fileup")
    @ResponseBody
    public HashMap<String, Object> uploadFile(
            @RequestParam("mainImage") MultipartFile mainImage,
            @RequestParam("contentImage") MultipartFile contentImage) {
        HashMap<String, Object> result = new HashMap<>();
        System.out.println("fileup Start");
        result.put("mainImage", saveAndUploadFile(mainImage, "mainImage"));
        result.put("contentImage", saveAndUploadFile(contentImage, "contentImage"));
        System.out.println("파일명 전환 직후 mainImage : " + result.get("mainImage") );
        System.out.println("파일명 전환 직후 contentImage : " + result.get("contentImage") );
        return result;
    }

    private Object saveAndUploadFile(MultipartFile file, String savePath) {
        String basePath = new File("src/main/resources/static/images/webtoon/webtoon_images/").getAbsolutePath();
        String Path;
        if (savePath.equals("mainImage")) {
            Path = basePath + "/title_img";
        } else {
            Path = basePath + "/content_img";
        }


        File directory = new File(Path); // file이 저장될 디렉토리
        if (!directory.exists()) {
            directory.mkdirs(); // 경로가 없으면 생성
        }

        Calendar today = Calendar.getInstance();
        long t = today.getTimeInMillis();
        String filename = file.getOriginalFilename();
        String fn1 = filename.substring(0, filename.indexOf("."));
        String fn2 = filename.substring(filename.indexOf("."));
        String savefilename = fn1 + t + fn2;
        String uploadPath = Path + "/" + savefilename;
        System.out.println("파일 저장 경로 = " + uploadPath);

        HashMap<String, Object> result = new HashMap<>();
        try {
            file.transferTo(new File(uploadPath));
            result.put("image", filename);
            result.put("savefilename", savefilename);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        return result;
    }

//========Q&AList=====================================

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


}

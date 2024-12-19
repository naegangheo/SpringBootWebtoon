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
        request.getSession().removeAttribute("page");

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
        int mCount= ads.adAllCountMember();
        int wCount = ads.adAllCountWebtoon();

        model.addAttribute("webtoonCount", wCount);
        model.addAttribute("memberCount", mCount);
        mav.addObject("webtoon", wvo);
        mav.setViewName("admin/webtoon/admin_webtoon_update");

        return mav;

    }

    @PostMapping("/updateWebtoon")
    @ResponseBody
    public String updateWebtoon(@RequestBody WebtoonVO webtoonvo, BindingResult result, HttpServletRequest request,Model model) {
        System.out.println("updateWebtoon VO:"+webtoonvo);

        String url = "redirect:/admin";
        if (result.getFieldError("subject")!=null) {
            model.addAttribute("message", "제목을 입력하세요");
            return "admin/webtoon/admin_webtoon_update";
        }
        if(result.getFieldError("content")!=null) {
            model.addAttribute("message", "내용을 입력하세요");
            return "admin/webtoon/admin_webtoon_update";
        }
        if (result.getFieldError("genre") != null) {
            model.addAttribute("message", "장르를 선택해 주세요.");
            return "admin/webtoon/admin_webtoon_update";
        }

        if (result.getFieldError("week") != null) {
            model.addAttribute("message", "요일을 선택해 주세요.");
            return "admin/webtoon/admin_webtoon_update";
        }
        ads.adminUpdateWebtoon(webtoonvo);


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
        System.out.println(result);
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
        request.getSession().removeAttribute("page");
        mav.addObject("qnaList", result.get("qnaList"));
        mav.addObject("paging", result.get("paging"));
        mav.setViewName("admin/qna/admin_qnalist");


        return mav;
    }

    @GetMapping("/adminQreplyList")
    @ResponseBody
    public  Map<String, Object> adminQreplyList(@RequestParam("qseq")int qseq) {

        HashMap<String, Object> result=ads.getAdminQna(qseq);

        Map<String, Object> response = new HashMap<>();
        response.put("qna", result.get("qna"));
        response.put("qreplyList", result.get("qreplyList"));
        System.out.println("qreply : "+result.get("qreplyList"));

        return response;
    }

    @PostMapping("/adminQreplyInsert")
    @ResponseBody
    public Map<String, Object> adminQreplyInsert(@RequestParam("qseq")int qseq, QreplyVO qreplyvo, HttpSession session, Model model) {

        AdminVO adminLogin=(AdminVO)session.getAttribute("loginAdmin");
        qreplyvo.setAdminid(adminLogin.getAdminid());
        HashMap<String, Object>result=ads.insertQreply(qreplyvo);
        Map<String, Object> response = new HashMap<>();
        response.put("qna", result.get("qna"));
        response.put("qreplyList", result.get("qreplyList"));
        return response;
    }

    @PostMapping("/adminQreplyDelete")
    @ResponseBody
    public Map<String, Object> adminQreplyDelete(@RequestParam("qseq")int qseq, @RequestParam("qrseq")int qrseq, QreplyVO qreplyvo) {
        HashMap<String, Object> result = ads.adminQreplyDelete(qreplyvo);
        Map<String, Object> response = new HashMap<>();
        response.put("reply", result.get("reply"));
        response.put("qreplyList", result.get("qreplyList"));
        return response;
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

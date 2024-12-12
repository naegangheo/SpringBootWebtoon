package com.example.webtoon.controller.mypage;


import com.example.webtoon.dto.MemberVO;
import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.mypage.CreatedService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class CreatedController {

    @Autowired
    private CreatedService cs;

    @Autowired
    private ServletContext context;

    @GetMapping("/created")
    public String created(@RequestParam(value = "wseq", required = false) Integer wseq, Model model, HttpSession session) {
        WebtoonVO webtoon = new WebtoonVO();

        MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");
        if (currentMember == null) {
            // loginForm 으로 이동
            return "redirect:/login";
        }
        // 기본 WebtoonVO 객체

      /*  if (wseq != null) {
            // 수정 시 기존 데이터 로드
            webtoon = cs.getWebtoonById(wseq);*/
            /*model.addAttribute("createTitle", "작품 수정");*/
      /*  } else {*/
            // 신규 등록
            model.addAttribute("createTitle", "신규 작품 등록");
       /* }*/

        // JSP로 데이터 전달
        model.addAttribute("webtoon", webtoon);
        return "mypage/webtoon_insert"; // JSP 파일 경로
    }

    /**
     * 파일 업로드 처리 메서드
     */
    @PostMapping("/uploadFile")
    @ResponseBody
    public HashMap<String, Object> uploadFile(
            @RequestParam("mainImage") MultipartFile mainImage,
            @RequestParam("contentImage") MultipartFile contentImage) {
        HashMap<String, Object> result = new HashMap<>();
        result.put("mainImage", saveAndUploadFile(mainImage, "mainImage"));
        result.put("contentImage", saveAndUploadFile(contentImage, "contentImage"));
        System.out.println("파일명 전환 직후 mainImage : " + result.get("mainImage") );
        System.out.println("파일명 전환 직후 contentImage : " + result.get("contentImage") );
        return result;
    }

    public HashMap<String, Object> saveAndUploadFile(MultipartFile file, String savePath){
        // 현재 작업 디렉토리를 기준으로 절대 경로 설정
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
        String filename = file.getOriginalFilename(); // 클라이언트가 업로드한 파일의 원래 이름
        String fn1 = filename.substring(0, filename.indexOf("."));  // 파일이름과 확장자 분리
        String fn2 = filename.substring(filename.indexOf("."));
        String savefilename = fn1 + t + fn2;
        String uploadPath = Path + "/" + savefilename;
        System.out.println("파일 저장 경로 = " + uploadPath);

        HashMap<String, Object> result = new HashMap<>();
        try {
            file.transferTo(new File(uploadPath));  // 파일 저장
            /*result.put("STATUS", "SUCCESS");*/
            result.put("image", filename);
            result.put("savefilename", savefilename);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
            /*result.put("STATUS", "FAILURE");*/
        }
        return result;
    }

    /**
     * 웹툰 저장 처리 메서드
     */
    @PostMapping("/insertWebtoon")
    @ResponseBody
    public String insertWebtoon(@RequestBody WebtoonVO webtoon, HttpSession session) {
        MemberVO currentMember = (MemberVO) session.getAttribute("loginUser");

            try {
                webtoon.setUserid(currentMember.getUserid());
                System.out.println("이미지 파일명: " + webtoon.getImage());
                System.out.println("이미지 파일명 2: " + webtoon.getImage2());
                cs.insertWebtoon(webtoon);
                return "success";
            } catch (Exception e) {
                e.printStackTrace();
                return "failure";
            }


        }

    }





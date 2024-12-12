package com.example.webtoon.controller.mypage;


import com.example.webtoon.service.main.MainServiceK;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class CreatedController {

    @Autowired
    private MainServiceK msk;

    @Autowired
    private ServletContext context;



    @PostMapping("/fileup")
    @ResponseBody
    public HashMap<String, Object> fileup(@RequestParam("fileimage") MultipartFile file) {
        // 파일 저장 경로
        String path = context.getRealPath("/images/upload");
        File directory = new File(path);
        if (!directory.exists()) {
            directory.mkdirs(); // 경로가 없으면 생성
        }

        // 파일명 생성
        Calendar today = Calendar.getInstance();
        long t = today.getTimeInMillis();
        String originalFilename = file.getOriginalFilename();
        String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String saveFilename = "webtoon_" + t + fileExtension;

        // 저장 경로
        String uploadPath = path + "/" + saveFilename;
        System.out.println("파일 저장 경로: " + uploadPath);

        // 응답 데이터 저장
        HashMap<String, Object> result = new HashMap<>();
        try {
            file.transferTo(new File(uploadPath)); // 파일 저장
            result.put("STATUS", "SUCCESS");
            result.put("originalFilename", originalFilename);
            result.put("saveFilename", saveFilename);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
            result.put("STATUS", "FAILURE");
        }

        return result;
    }

    // 작품 생성 및 수정
    @PostMapping("/saveWebtoon")
    public ModelAndView saveWebtoon(@RequestParam("title") String title,
                                    @RequestParam("genre") int genre,
                                    @RequestParam("content") String content,
                                    @RequestParam("mainImage") MultipartFile mainImage,
                                    @RequestParam("contentImage") MultipartFile contentImage) {
        ModelAndView mav = new ModelAndView();

        // 파일 업로드 로직 호출
        HashMap<String, Object> mainImageResult = fileup(mainImage);
        HashMap<String, Object> contentImageResult = fileup(contentImage);

        // 업로드 성공 여부 확인
        if ("SUCCESS".equals(mainImageResult.get("STATUS")) && "SUCCESS".equals(contentImageResult.get("STATUS"))) {
            System.out.println("대표 이미지: " + mainImageResult.get("saveFilename"));
            System.out.println("웹툰 이미지: " + contentImageResult.get("saveFilename"));

            // 이후 DB에 저장 로직 추가 필요
            mav.addObject("message", "작품이 성공적으로 저장되었습니다.");
        } else {
            mav.addObject("message", "파일 업로드 실패. 다시 시도해주세요.");
        }

        mav.setViewName("redirect:/mypage");
        return mav;
    }



}

package com.example.webtoon.controller.mypage;


import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceK;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import java.util.ArrayList;
import java.util.Arrays;

@Controller
public class CreatedController {

    @Autowired
    private MainServiceK msk;

    @GetMapping("/created")
    public ModelAndView created(@RequestParam(value = "wseq", required = false) Integer   wseq) {
        ModelAndView mav = new ModelAndView();

        if (wseq != null) {
            // 기존 작품 수정
            WebtoonVO webtoon = msk.searchWebtoon(wseq);
            mav.addObject("webtoon", webtoon);
            mav.addObject("createTitle", "작품 수정");
        } else {
            // 신규 작품 등록
            mav.addObject("createTitle", "신규 작품 등록");
        }



        mav.setViewName("mypage/webtoon_insert");

        return mav;

    }

    @PostMapping("/webtoon/save")
    public String saveWebtoon(@ModelAttribute WebtoonVO webtoon,
                              @RequestParam("mainImage") MultipartFile mainImage,
                              @RequestParam("contentImage") MultipartFile contentImage) {
        msk.saveWebtoon(webtoon, mainImage, contentImage);
        return "redirect:/best";

    }
}

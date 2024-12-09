package com.example.webtoon.controller;

import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceL;
import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class WebtoonController {

    @Autowired
    MainServiceL sl;

    @GetMapping("/")
    public String main(Model model) {

       List<HashMap<String, Object>> webtoon = sl.select_webtoon();

       model.addAttribute("webtoon", webtoon);
       return "main";


    }


//    @GetMapping("/webtoonview")
//    public String webtoon_view() {
//        return "/webtoon/webtoon_view";
//
//    }

    @GetMapping("/notice")
    public String notice() {

        return "notice_main";
    }

    @GetMapping("/mypage")

    public String mypage() {return "webtoon_insert";}


    @GetMapping("/best")
    public String best() {
        return "webtoon/best_list";

    }


}

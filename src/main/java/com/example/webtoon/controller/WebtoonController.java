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


  


    @GetMapping("/created")

    public String mypage() {return "mypage/webtoon_insert";}

=======
    @GetMapping("/writeFrom")
    public String mypage() {
        return "/mypage/webtoon_insert";}





}

package com.example.webtoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebtoonController {

    @GetMapping("/")
    public String main() {
        return "main";
    }


    @GetMapping("/webtoonview")
    public String webtoon_view() {
        return "/webtoon/webtoon_view";

    }

    @GetMapping("/writeFrom")
    public String mypage() {
        return "/mypage/webtoon_insert";}

    @GetMapping("/best")
    public String best() {
        return "webtoon/best_list";

    }


}

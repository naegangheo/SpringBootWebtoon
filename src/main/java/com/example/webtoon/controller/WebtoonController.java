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

    @GetMapping("/notice")
    public String notice() {

        return "notice_main";
    }

    @GetMapping("/mypage")

    public String mypage() {return "webtoon_insert";}





}

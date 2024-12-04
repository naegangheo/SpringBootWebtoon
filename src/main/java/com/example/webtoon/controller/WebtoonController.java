package com.example.webtoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebtoonController {

    @GetMapping("/")
    public String main() {
        return "main";
    }


    @GetMapping("/best")
    public String best(){
        return "best";

    }

}

package com.example.webtoon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebtoonController {

    @GetMapping("/")
    public String main() {
        return "main";
    }

//    @GetMapping("/login")
//    public String login() {
//        return "member/login";
//    }
//
//    @GetMapping("/contract")
//    public String contract() {
//        return "member/agree";
//    }
//
//    @GetMapping("/join")
//    public String join() {
//        return "member/join";
//    }

    @GetMapping("/webtoon_view")
    public String webtoonview() {
        return "webtoon_view";
    }

    @GetMapping("/notice")
    public String notice() {
        return "notice/noticemain";
    }

    @GetMapping("/mypage")
    public String mypage() {return "mypage/webtooninsert";}

   @GetMapping("/best")
      public String best(){
        return "webtoon/best_list";
   }


}

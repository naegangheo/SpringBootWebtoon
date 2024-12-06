package com.example.webtoon.controller.main;

import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceH;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainControllerH {

    @Autowired
    MainServiceH msh;

    @GetMapping("/genre")
    public ModelAndView genre(@RequestParam("genre") int genre) {

        ModelAndView mav = new ModelAndView();
        if(genre == 1){
            mav.addObject("messageG", "전체");
        }else if(genre==2){
            mav.addObject("messageG", "로맨스");
        }else if(genre==3){
            mav.addObject("messageG", "판타지");
        }else if(genre==4){
            mav.addObject("messageG", "액션");
        }else if(genre==5){
            mav.addObject("messageG", "일상");
        }else if(genre==6){
            mav.addObject("messageG", "스릴러");
        }

        mav.setViewName("/webtoon/genre_list");

        return mav;

    }

}

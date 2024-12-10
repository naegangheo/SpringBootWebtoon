package com.example.webtoon.controller.main;


import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceH;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class MainControllerH {

    @Autowired
    MainServiceH msh;
    
    // list의 타이틀을 장르에 맞춰서 변환
//    @GetMapping("/genrecategory")
//    public ModelAndView genre(@RequestParam("genre") int genre) {
//
//        ModelAndView mav = new ModelAndView();
//        System.out.println("받은 장르: " + genre);
//
//        String messageG = switch (genre) {
//            case 1 -> "전체";
//            case 2 -> "로맨스";
//            case 3 -> "판타지";
//            case 4 -> "액션";
//            case 5 -> "일상";
//            case 6 -> "스릴러";
//            default -> "null";
//        };
//        mav.addObject("messageG", messageG);
//
//        System.out.println("MessageG: " + messageG);
//
//        System.out.println("genre_List 메서드, genre 값: " + genre);
//
//        List<WebtoonVO> list= msh.getGenreList(genre);
//
//        mav.addObject("genreList", list);
//        mav.setViewName("/webtoon/genre_list");
//
//        return mav;
//    }

    @GetMapping("/genrecategory")
    public ModelAndView genre(
            @RequestParam(value = "genre", defaultValue = "1") int genre,
            HttpServletRequest request) {

        ModelAndView mav = new ModelAndView();
        System.out.println("받은 장르: " + genre);

        String messageG = switch (genre) {
            case 1 -> "전체";
            case 2 -> "로맨스";
            case 3 -> "판타지";
            case 4 -> "액션";
            case 5 -> "일상";
            case 6 -> "스릴러";
            default -> "null";
        };

        System.out.println("MessageG: " + messageG);
        System.out.println("genre_List 메서드, genre 값: " + genre);


        mav.addObject("messageG", messageG);
        mav.addObject("genre", genre);

        List<WebtoonVO> list= msh.getGenreList(genre);
        System.out.println(list);
        if(list==null||list.isEmpty()){
            mav.setViewName("error/error");
            return mav;
        }
        mav.addObject("genreList", list);

        HashMap<String, Object> result = msh.selectGenreList(genre,request);
        System.out.println(result);
        if(result==null||result.get("paging")==null) {
            mav.setViewName("error/error");
            return mav;
        }
        mav.addObject("selectGenreList", result.get("selectGenreList"));
        System.out.println("result"+result.get("selectGenreList"));
        mav.addObject("paging", result.get("paging"));

        mav.setViewName("/webtoon/genre_list");

        return mav;
    }

    @GetMapping("/webtoon_view")
    public ModelAndView webtoonView(@RequestParam("wseq") int wseq) {
        ModelAndView mav = new ModelAndView();

        mav.addObject("webtoonVO", msh.getWebtoon(wseq));
        mav.setViewName("/webtoon/webtoon_detail");

        return mav;
    }




}

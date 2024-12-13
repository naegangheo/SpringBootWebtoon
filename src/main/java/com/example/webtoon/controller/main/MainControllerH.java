package com.example.webtoon.controller.main;


import com.example.webtoon.dto.MemberVO;
import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceH;
import com.example.webtoon.service.main.MainServiceL;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

@Controller
public class MainControllerH {

    @Autowired
    MainServiceH msh;

    @Autowired
    MainServiceL sl;


    @GetMapping("/genreCategory")
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
    public ModelAndView webtoonView(@RequestParam("wseq") int wseq,
                                    @RequestParam(value = "gender", required = false, defaultValue = "N") String gender) {
        ModelAndView mav = new ModelAndView();

        System.out.println("성별 : " + gender);
        mav.addObject("webtoonVO", msh.getWebtoon(wseq,gender));
        mav.setViewName("/webtoon/webtoon_detail");

        return mav;
    }

    @GetMapping("/readCountByGenre")
    @ResponseBody
    public List<WebtoonVO> readCountByGenre(
            @RequestParam(value = "genre", required = true, defaultValue = "2") int genre,
            @RequestParam(value="gender", required = false) String gender,
            Model model, HttpSession session) {


        // 세션에서 로그인 유저 가져오기
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

        // 성별 결정 로직
        if (loginUser == null) {
            gender = "N";  // 로그인하지 않음
        } else {
            gender = loginUser.getGender();  // 세션의 성별 가져오기
            if (!"M".equals(gender) && !"F".equals(gender)) {
                gender = "N";  // 유효하지 않은 값일 경우 "N"
            }
        }
        // 장르와 성별 출력 (디버그)
        System.out.println("선택된 장르: " + genre);
        System.out.println("gender: " + gender);

        // 장르 기반 조회수 목록 가져오기
        List<WebtoonVO> list = msh.getReadCountByGenre(genre);

        // 조회 결과 출력 (디버그)
        System.out.println("조회된 웹툰 리스트: " + list);

        // JSON 응답으로 반환
        return list;
    }




}


package com.example.webtoon.controller.main;

import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceK;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MainControllerK {

    @Autowired
    private MainServiceK msk; // 의존성 주입


    @GetMapping("/best")
    public ModelAndView bestList(@RequestParam(value = "filter", required = false, defaultValue = "update") String filter) {
        ModelAndView mav = new ModelAndView();


        List<WebtoonVO> BestListTop = msk.getBestListTop(3);
        List<WebtoonVO> list ;

        // 정렬 기준에 따라 서비스 메서드 호출
        switch (filter) {
            case "read":
                list = msk.getbestlist();
                break;
            case "name":
                list = msk.getNameList();
                break;
            default:
                list = msk.getDayList();
                break;
        }

        mav.addObject("BestListTop", BestListTop);
        mav.addObject("webtoonList", list);
        mav.setViewName("webtoon/best_list");



        return mav;
    }

}
    /*@GetMapping("/today-best")
    public ModelAndView getTodayBest() {
        ModelAndView mav = new ModelAndView();

        List<WebtoonVO> BestListTop = msk.BestListTop(3);

        mav.addObject("BestListTop", BestListTop);

        mav.setViewName("webtoon/best_list");

        return mav;
    }*/



    /*@GetMapping("/best_list")
    public ModelAndView best_list(@RequestParam(value = "filter", required = false, defaultValue = "update") String filter) {
        ModelAndView mav = new ModelAndView();
        List<WebtoonVO> BestList;

        // 정렬 기준에 따라 서비스 메서드 호출
        switch (filter) {
            case "read":
                BestList = msk.getWebtoonsByReadCountDesc();
                break;
            case "name":
                BestList = msk.getWebtoonsByNameOrder();
                break;
            default:
                BestList = msk.getWebtoonsByDateAsc();
                break;
        }

        mav.addObject("BestList", BestList);
        mav.addObject("filter", filter);
        mav.setViewName("webtoon/best_list");

        return mav;
    }*/







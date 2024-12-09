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

    @GetMapping("/best_list")
    public ModelAndView best_list(@RequestParam(value = "filter", required = false, defaultValue = "update") String filter, Model model) {
        ModelAndView mav = new ModelAndView();
        List<WebtoonVO> webtoonList;

        // 정렬 기준에 따라 서비스 메서드 호출
        switch (filter) {
            case "read":
                webtoonList = msk.getWebtoonsByReadCountDesc();
                break;
            case "name":
                webtoonList = msk.getWebtoonsByNameOrder();
                break;
            default:
                webtoonList = msk.getWebtoonsByDateAsc();
                break;
        }

        mav.addObject("webtoonList", webtoonList);
        mav.addObject("filter", filter);
        mav.setViewName("best_list");

        return mav;
    }

    @GetMapping("/today-best")
    public ModelAndView getTodayBestWebtoons() {
        ModelAndView mav = new ModelAndView();

        List<WebtoonVO> topWebtoons = msk.getTopWebtoonsByReadCount(3);

        mav.addObject("topWebtoons", topWebtoons);

        mav.setViewName("best_list");

        return mav;
    }

}

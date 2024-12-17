package com.example.webtoon.controller.main;

import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainControllerL {

    @Autowired
    MainServiceL sl;

//    요일 전체를 누르면 웹툰 리스트로 이동
    @GetMapping("/week")
    public ModelAndView week(@RequestParam("week") int week) {

        ModelAndView mav = new ModelAndView();
        mav.addObject("week", sl.selectWeek(week) );
        mav.addObject("weekend", getDayName(week));
        mav.setViewName("webtoon/week_list");
        return mav;

    }

    private Object getDayName(int week) {
        switch (week) {
            case 1: return "월요일";
            case 2: return "화요일";
            case 3: return "수요일";
            case 4: return "목요일";
            case 5: return "금요일";
            case 6: return "토요일";
            case 7: return "일요일";
            default: return "전체 요일";
        }
    }

    @GetMapping("/week_update")
    public ModelAndView weekUpdate(@RequestParam("week") int week) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("week", sl.selectWeek_update(week) );
        mav.addObject("weekend", getDayName(week));
        mav.setViewName("webtoon/week_list");
        return mav;

    }

    @GetMapping("/webtoonview")
    public String webtoon_view(@RequestParam("wseq") int wseq, Model model) {

        WebtoonVO wvo = sl.get_webtoon(wseq);
        model.addAttribute("webtoon", wvo);
        System.out.println("공지사항 목록 (getNoticeList): "); // 로그로 확인
        return "webtoon_detail";

    }


}

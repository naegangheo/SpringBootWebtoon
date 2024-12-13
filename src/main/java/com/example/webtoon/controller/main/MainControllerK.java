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
    public ModelAndView bestList(
            @RequestParam(value = "filter", required = false, defaultValue = "update") String filter,
            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
            @RequestParam(value = "pageSize", required = false, defaultValue = "21") int pageSize

    ) {
        ModelAndView mav = new ModelAndView();
        List<WebtoonVO> BestListTop = msk.getBestListTop(3);
        List<WebtoonVO> list ;
        int totalCount = msk.getTotalCount(); // 전체 데이터 수 가져오기
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

        // 정렬 기준에 따라 서비스 메서드 호출
        switch (filter) {
            case "read":
                list = msk.getbestlist(page, pageSize);
                break;
            case "name":
                list = msk.getNameList(page, pageSize);
                break;
            default:
                list = msk.getDayList(page, pageSize);
                break;
        }



        mav.addObject("BestListTop", BestListTop);
        mav.addObject("webtoonList", list);
        mav.addObject("currentPage", page);
        mav.addObject("pageSize", pageSize);
        mav.addObject("totalPages", totalPages);
        mav.setViewName("webtoon/best_list");



        return mav;
    }

}









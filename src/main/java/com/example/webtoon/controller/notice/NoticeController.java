package com.example.webtoon.controller.notice;

import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.service.notice.NoticeService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    NoticeService ns;

    @GetMapping("/notice")
    public ModelAndView notice(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HashMap<String, Object> result = ns.selectNotice(request);

        mav.addObject("noticeList", result.get("noticeList"));
        mav.addObject("paging", result.get("paging"));
        mav.setViewName("/notice/notice_list");

        return mav;

    }

}

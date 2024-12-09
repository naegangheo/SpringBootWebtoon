package com.example.webtoon.controller.notice;

import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.service.notice.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class NoticeController {

    @Autowired
    NoticeService ns;

    @GetMapping("/notice")
    public ModelAndView notice() {
        ModelAndView mav = new ModelAndView();
        List<NoticeVO> list = ns.getNoticeList();

        mav.addObject("noticeList", list);
        mav.setViewName("/notice/notice_main");

        return mav;

    }

}

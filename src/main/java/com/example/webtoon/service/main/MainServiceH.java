package com.example.webtoon.service.main;

import com.example.webtoon.dao.main.IMainDaoH;
import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.dto.Paging;
import com.example.webtoon.dto.WebtoonVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class MainServiceH {

    @Autowired
    IMainDaoH mdaoh;


    public List<WebtoonVO> getGenreList(int genre) {
        List<WebtoonVO> list = mdaoh.getGenreList(genre);
        return list;
    }


    public List<WebtoonVO> getNoticeList() {
        List<WebtoonVO> list = mdaoh.getNoticeList();
        return list;
    }

    public WebtoonVO getWebtoon(int wseq) {
        return mdaoh.getWebtoon(wseq);
    }

    public HashMap<String, Object> selectGenreList(int genre, HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        int page=1;
        if(request.getParameter("page") != null) {
            page= Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        }else if(session.getAttribute("page") != null) {
            page=(Integer)session.getAttribute("page");
        }

        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayRow(15);
        int count= mdaoh.getAllcount(genre);
        paging.setTotalCount(count);
        paging.calPaging();

        System.out.println("장르: " + genre + " 전체 웹툰 수: " + count);
        List<WebtoonVO> list =mdaoh.selectGenreList(genre,paging.getDisplayRow(), paging.getStartNum());

        result.put("selectGenreList", list);
        System.out.println("list"+ list);
        result.put("paging", paging);
        return result;

    }
}

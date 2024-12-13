package com.example.webtoon.service.admin;

import com.example.webtoon.dao.admin.IAdminDao;
import com.example.webtoon.dto.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
public class AdminService {

    @Autowired
    IAdminDao iadao;


    public AdminVO getAdmin(String adminid) {return iadao.getAdmin(adminid);
    }

    public HashMap<String, Object> adSelectWebtoon(HttpServletRequest request) {
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
        int count= iadao.getAllcount();
        paging.setTotalCount(count);
        paging.calPaging();

        List<WebtoonVO> list= iadao.adSelectWebtoon(paging);


        result.put("adSelectWebtoon",list);
        result.put("paging", paging);
        return result;
    }

    public HashMap<String, Object> adSelectQna(HttpServletRequest request) {
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
        int count= iadao.getAllcountQna();
        paging.setTotalCount(count);
        paging.calPaging();

        List<QnaVO> list= iadao.adSelectQna(paging);


        result.put("adSelectQna",list);
        result.put("paging", paging);
        return result;

    }




    public int adAllCountMember() {
        return iadao.adAllCountMember();
    }

    public int adAllCountWebtoon() {
        return iadao.getAllcount();
    }

    public HashMap<String, Object> adSelectNotice(HttpServletRequest request) {
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
        int count= iadao.getAllcountNotice();
        paging.setTotalCount(count);
        paging.calPaging();

        List<NoticeVO> list= iadao.adSelectNotice(paging);


        result.put("adSelectNotice",list);
        result.put("paging", paging);
        return result;
    }

    public void adminWebtoonDelete(int wseq) {
        iadao.adminWebtoonDelete(wseq);
    }

    public WebtoonVO adGetWebtoon(int wseq) {
        return iadao.adGetWebtoon(wseq);
    }



}

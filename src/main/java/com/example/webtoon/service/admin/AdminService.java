package com.example.webtoon.service.admin;

import com.example.webtoon.dao.admin.IAdminDao;
import com.example.webtoon.dto.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
public class AdminService {

    @Autowired
    IAdminDao iadao;


    public AdminVO getAdmin(String adminid) {
        return iadao.getAdmin(adminid);
    }

    public int adAllCountMember() {
        return iadao.adAllCountMember();
    }

    public int adAllCountWebtoon() {
        return iadao.getAllcount();
    }

    //===========webtoon==========================================
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

    public void adminWebtoonDelete(int wseq) {
        iadao.adminWebtoonDelete(wseq);
    }

    public WebtoonVO adGetWebtoon(int wseq) {
        return iadao.adGetWebtoon(wseq);
    }


    // Q&A=================================================

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


        result.put("qnaList",list);
        result.put("paging", paging);
        return result;

    }

    //Notice=========================================
    public List<NoticeVO> adSelectNotice(Paging paging) {
        return iadao.adSelectNotice(paging);
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


    //==========WebtoonList=========================



    //==========WebtoonList=========================
    public void adminUpdateWebtoon(WebtoonVO webtoonvo) {
        System.out.println(webtoonvo);
        iadao.adminUpdateWebtoon(webtoonvo);
    }

    //==========Q&AList=============================


    //==========NoticeList=============================

    public void insertNotice(NoticeVO noticevo) {
        iadao.insertNotice(noticevo);
    }

    public NoticeVO getNoticeUpdate(int nseq) {

        NoticeVO nvo= iadao.selectNoticeOne(nseq);
        return nvo;

    }

    public void updateNotice(NoticeVO noticevo) {

        iadao.updateNotice(noticevo);

    }

    public void adminNoticeDelete(int nseq) {
        iadao.adminNoticeDelete(nseq);
    }




    public HashMap<String, Object> getAdminQna(int qseq) {
        HashMap<String, Object> result = new HashMap<>();

        QnaVO qvo = iadao.selectQnaOne(qseq);
        result.put("qna",qvo);
        System.out.println(qvo);

        List<QreplyVO> list= iadao.selectQreply(qseq);
        result.put("qreplyList",list);
        System.out.println(list);

        return result;
    }


    public HashMap<String, Object> insertQreply(QreplyVO qreplyvo) {
        HashMap<String, Object> result= new HashMap<>();
        iadao.insertQreply(qreplyvo);

        QnaVO qvo = iadao.selectQnaOne(qreplyvo.getQseq());
        result.put("qna",qvo);

        List<QreplyVO>list=iadao.selectQreply(qreplyvo.getQseq());
        result.put("qreplyList",list);
        return result;
    }

    public HashMap<String, Object> adminQreplyDelete(QreplyVO qreplyvo) {

        HashMap<String, Object> result= new HashMap<>();
        iadao.adminQreplyDelete(qreplyvo);

        QnaVO qvo= iadao.selectQnaOne(qreplyvo.getQseq());
        result.put("qna",qvo);
        List<QreplyVO>list=iadao.selectQreply(qreplyvo.getQseq());
        result.put("qreplyList",list);

       return result;

    }


    //===========계속 추가가되겟지? 그러니까 여기 밑에 추가될테니까 list별로 구분해주세요




}
package com.example.webtoon.service.admin;

import com.example.webtoon.dao.admin.IAdminDao;
import com.example.webtoon.dto.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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


        result.put("adSelectQna",list);
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

    //==>Q&A List를 보여주면되는데 사용자별 총개수가 왜필요한지 모르겟다요
    /*userid로 myqnalist 가져오는 작업*/
    public HashMap<String, Object> getUserSpecificQnaList(HttpServletRequest request, String userId) {
        HashMap<String, Object> result = new HashMap<>();
        HttpSession session = request.getSession();
        int page = 1;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            session.setAttribute("page", page);
        } else if (session.getAttribute("page") != null) {
            page = (Integer) session.getAttribute("page");
        }

        Paging paging = new Paging();
        paging.setPage(page);
        int count = iadao.getCountQnaByUserId(userId); // 사용자별 Q&A 총 개수
        paging.setTotalCount(count);
        paging.calPaging();

        List<QnaVO> list = iadao.selectQnaByUserId(userId, paging); // 사용자별 Q&A 데이터 가져오기

        result.put("qnaList", list);
        result.put("paging", paging);
        return result;
    }
    
    //===========계속 추가가되겟지? 그러니까 여기 밑에 추가될테니까 list별로 구분해주세요
    
    
    
}

package com.example.webtoon.service.notice;

import com.example.webtoon.dto.Paging;
import com.example.webtoon.dao.notice.INoticeDao;
import com.example.webtoon.dto.NoticeVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class NoticeService {

    @Autowired
    INoticeDao ndao;

    public HashMap<String, Object> selectNotice(HttpServletRequest request) {
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
        int count= ndao.getAllcount();
        paging.setTotalCount(count);
        paging.calPaging();

        List<NoticeVO> list= ndao.selectNotice(paging);


        result.put("noticeList",list);
        result.put("paging", paging);
        return result;
    }
}

package com.example.webtoon.service.member;

import com.example.webtoon.dao.member.IMemberDao;
import com.example.webtoon.dto.Paging;
import com.example.webtoon.dto.QnaVO;
import com.example.webtoon.dto.QreplyVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class QnaService {
    @Autowired
    IMemberDao IMemberDao;

    public void insertQna(QnaVO qnaVO) {
        IMemberDao.insertQna(qnaVO);
    }
    public void updateQna(QnaVO qnaVO) {
        IMemberDao.updateQna(qnaVO);
    }
    public void deleteQna(int qseq, String userid) { IMemberDao.deleteQna(qseq, userid); }
    public List<QreplyVO> getReplies(int qseq) { return IMemberDao.selectRepliesByQseq(qseq); }

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
        int count = IMemberDao.getCountQnaByUserId(userId);
        paging.setTotalCount(count);
        paging.calPaging();

        List<QnaVO> list = IMemberDao.selectQnaByUserId(userId, paging);

        // 댓글 리스트 가져오기
        HashMap<Integer, List<QreplyVO>> qnaReplyMap = new HashMap<>();
        for (QnaVO qna : list) {
            List<QreplyVO> replies = IMemberDao.selectRepliesByQseq(qna.getQseq());
            qnaReplyMap.put(qna.getQseq(), replies);
        }

        result.put("qnaList", list);
        result.put("qnaReplyList", qnaReplyMap); // 댓글 리스트를 qnaReplyList로 저장
        result.put("paging", paging);
        return result;
    }
}

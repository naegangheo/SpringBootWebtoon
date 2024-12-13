package com.example.webtoon.service.member;

import com.example.webtoon.dao.admin.IAdminDao;
import com.example.webtoon.dto.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class QnaService {
    @Autowired
    IAdminDao iadminDao;

    public void insertQna(QnaVO qnaVO) {
        iadminDao.insertQna(qnaVO);
    }
    public void updateQna(QnaVO qnaVO) {
        iadminDao.updateQna(qnaVO);
    }
    public void deleteQna(int qseq, String userid) {
        iadminDao.deleteQna(qseq, userid);
    }
}

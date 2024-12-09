package com.example.webtoon.service.notice;

import com.example.webtoon.dao.notice.INoticeDao;
import com.example.webtoon.dto.NoticeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    @Autowired
    INoticeDao ndao;

    public List<NoticeVO> getNoticeList() {
        return ndao.getNoticeList();

    }
}

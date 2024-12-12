package com.example.webtoon.service.member;

import com.example.webtoon.dao.member.IMemberDao;
import com.example.webtoon.dto.WebtoonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WebtoonService {
    @Autowired
    IMemberDao mdao;

    // 제목이나 작가명으로 검색
    public List<WebtoonVO> searchWebtoonsByKeyword(String keyword) {
        return mdao.searchBySubjectOrUserid(keyword);
    }
}

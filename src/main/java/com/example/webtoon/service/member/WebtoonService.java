package com.example.webtoon.service.member;

import com.example.webtoon.dao.member.IMemberDao;
import com.example.webtoon.dto.WebtoonVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WebtoonService {
    private final IMemberDao mdao;

    public WebtoonService(IMemberDao mdao) {
        this.mdao = mdao;
    }

//    제목만으로 검색
//    public List<WebtoonVO> searchWebtoonsBySubject(String keyword) {
//        return mdao.searchBySubject(keyword);
//    }

    // 제목이나 작가명으로 검색
    public List<WebtoonVO> searchWebtoonsByKeyword(String keyword) {
        return mdao.searchBySubjectOrUserid(keyword);
    }
}

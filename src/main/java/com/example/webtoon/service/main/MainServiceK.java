package com.example.webtoon.service.main;

import com.example.webtoon.dao.main.IMainDaoK;
import com.example.webtoon.dto.WebtoonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainServiceK {

    @Autowired
     IMainDaoK mdaok; // Main DAO 인터페이스 의존성 주입

    public List<WebtoonVO> getTopWebtoonsByReadCount(int limit) {
        return mdaok.selectTopWebtoonsByReadCount(limit);
    }

    // 조회수 기준으로 내림차순 정렬된 웹툰 리스트 가져오기
    public List<WebtoonVO> getWebtoonsByReadCountDesc() {
        return mdaok.selectWebtoonsByReadCountDesc();
    }

    // 이름 기준으로 가나다순 정렬된 웹툰 리스트 가져오기
    public List<WebtoonVO> getWebtoonsByNameOrder() {
        return mdaok.selectWebtoonsByNameOrder();
    }

    // 등록 날짜 기준으로 오름차순 정렬된 웹툰 리스트 가져오기
    public List<WebtoonVO> getWebtoonsByDateAsc() {
        return mdaok.selectWebtoonsByDateAsc();
    }

}
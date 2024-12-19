package com.example.webtoon.service.mypage;


import com.example.webtoon.dao.main.IMainDaoK;

import com.example.webtoon.dto.WebtoonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CreatedService {

    @Autowired
    private IMainDaoK mdaok; // Main DAO 인터페이스 의존성 주입

  /*  // 특정 웹툰 조회
    public WebtoonVO getWebtoonById(int wseq) {
        return mdaok.getWebtoonById(wseq);
    }*/

    // 새로운 웹툰 등록
    public void insertWebtoon(WebtoonVO webtoon) {
        mdaok.insertWebtoon(webtoon);
    }

    // 기존 웹툰 수정
   /* public void updateWebtoon(WebtoonVO webtoon) {
        mdaok.updateWebtoon(webtoon);}*/

    }


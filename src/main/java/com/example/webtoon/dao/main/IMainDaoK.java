package com.example.webtoon.dao.main;


import com.example.webtoon.dto.WebtoonVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMainDaoK {



    // 등록 날짜가 빠른 순서로 웹툰 리스트 조회
    List<WebtoonVO> getDayList();

    // 작품 이름이 가나다순으로 정렬된 웹툰 리스트 조회
    List<WebtoonVO> getNameList();

       // 조회수 기준 상위 N개의 웹툰 가져오기
    List<WebtoonVO> getBestListTop(int limit);

    // 조회수가 높은 순서로 웹툰 리스트 조회
    List<WebtoonVO> getbestlist();

    // 기존 웹툰 조회



    void saveFileInfo(WebtoonVO vo);

    WebtoonVO getFileInfo(int wseq);

    void insertWebtoon(WebtoonVO webtoonVO);

    void updateWebtoon(WebtoonVO webtoonVO);

    WebtoonVO findWebtoonById(int wseq);

}













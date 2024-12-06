package com.example.webtoon.dao.main;


import com.example.webtoon.dto.WebtoonVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMainDaoK {


    // 조회수 기준으로 웹툰 리스트 조회
    List<WebtoonVO> selectWebtoonByReadCount();

    // 등록 날짜가 빠른 순서로 웹툰 리스트 조회
    List<WebtoonVO> selectWebtoonsByDateAsc();

    // 조회수가 높은 순서로 웹툰 리스트 조회
    List<WebtoonVO> selectWebtoonsByReadCountDesc();

    // 작품 이름이 가나다순으로 정렬된 웹툰 리스트 조회
    List<WebtoonVO> selectWebtoonsByNameOrder();

       // 조회수 기준 상위 N개의 웹툰 가져오기
    List<WebtoonVO> selectTopWebtoonsByReadCount(int limit);
}













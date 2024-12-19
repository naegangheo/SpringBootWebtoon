package com.example.webtoon.service.main;

import com.example.webtoon.dao.main.IMainDaoK;
import com.example.webtoon.dto.WebtoonVO;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Service
public class MainServiceK {

    @Autowired
     IMainDaoK mdaok; // Main DAO 인터페이스 의존성 주입
    @Autowired
    private ServletContext context;


    public List<WebtoonVO> getBestListTop(int limit) {
        return mdaok.getBestListTop(limit);
    }

    // 이름 기준으로 가나다순 정렬된 웹툰 리스트 가져오기
    public List<WebtoonVO> getNameList(int page, int pageSize) {
        int offset = (page - 1) * pageSize; // 페이징 시작점 계산
        return mdaok.getNameList(pageSize, offset);
    }

    // 등록 날짜 기준으로 오름차순 정렬된 웹툰 리스트 가져오기
    public List<WebtoonVO> getDayList(int page, int pageSize) {
        int offset = (page - 1) * pageSize; // 페이징 시작점 계산
        return mdaok.getDayList(pageSize, offset);
    }

    // 조회수 기준으로 내림차순 정렬된 웹툰 리스트 가져오기
    public List<WebtoonVO> getbestlist(int page, int pageSize) {
        int offset = (page - 1) * pageSize; // 페이징 시작점 계산
        List<WebtoonVO> list=mdaok.getbestlist(pageSize, offset);
        return list;
    }

    public int getTotalCount() {
        return mdaok.getTotalCount();
    }


}

























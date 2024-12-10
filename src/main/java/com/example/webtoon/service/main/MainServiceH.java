package com.example.webtoon.service.main;

import com.example.webtoon.dao.main.IMainDaoH;
import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.dto.WebtoonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class MainServiceH {

    @Autowired
    IMainDaoH mdaoh;


    public List<WebtoonVO> getGenreList(int genre) {

        List<WebtoonVO> list = mdaoh.getGenreList(genre);

        return list;
    }


    public List<WebtoonVO> getNoticeList() {

        List<WebtoonVO> list = mdaoh.getNoticeList();
        return list;

    }

    public WebtoonVO getWebtoon(int wseq) {
        return mdaoh.getWebtoon(wseq);
    }
}

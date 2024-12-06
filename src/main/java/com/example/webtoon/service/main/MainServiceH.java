package com.example.webtoon.service.main;

import com.example.webtoon.dao.main.IMainDaoH;
import com.example.webtoon.dto.WebtoonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainServiceH {

    @Autowired
    IMainDaoH mdaoh;


    public WebtoonVO selectGenreBest(int wseq) {

        return mdaoh.selectGenreBest(wseq);

    }
}

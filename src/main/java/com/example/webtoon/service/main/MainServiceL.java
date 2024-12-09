package com.example.webtoon.service.main;

import com.example.webtoon.dao.main.IMainDaoL;
import com.example.webtoon.dto.WebtoonVO;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class MainServiceL {

    @Autowired
    IMainDaoL mdaoL;


    public List<WebtoonVO> selectWeek( int week) {

        return mdaoL.getWeek(week);

    }

    public List<WebtoonVO> selectWeek_update(int week) {

        return mdaoL.getWeek_update(week);

    }

    @Transactional
    public WebtoonVO get_webtoon(int wseq) {

        mdaoL.readcount_webtoon(wseq);
        return mdaoL.get_webtoon(wseq);

    }

    public List<HashMap<String, Object>> select_webtoon() {

        return mdaoL.select_webtoon();

    }
}

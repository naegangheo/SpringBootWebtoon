package com.example.webtoon.service.main;

import com.example.webtoon.dao.main.IMainDaoL;
import com.example.webtoon.dto.WebtoonVO;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MainServiceL {

    @Autowired
    IMainDaoL mdaoL;


    public List<WebtoonVO> selectWeek(@Valid int week) {

        return mdaoL.getWeek(week);

    }

    public Object selectWeek_update(int week) {

        return mdaoL.getWeek_update(week);

    }
}

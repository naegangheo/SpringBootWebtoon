package com.example.webtoon.dao.main;


import com.example.webtoon.dto.WebtoonVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMainDaoL {


    List<WebtoonVO> getWeek(int week);
    List<WebtoonVO> getWeek_update(int week);
}

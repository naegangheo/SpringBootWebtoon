package com.example.webtoon.dao.main;


import com.example.webtoon.dto.WebtoonVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface IMainDaoL {


    List<WebtoonVO> getWeek( int week);
    List<WebtoonVO> getWeek_update( int week);
    WebtoonVO get_webtoon( int wseq);
    void readcount_webtoon(int wseq);
    List<WebtoonVO> select_webtoon();

    List<WebtoonVO> lastWebtoon();

//    ajax(sg)
//    List<WebtoonVO> selectByGenre(@Param("genre") String genre);
}

package com.example.webtoon.dao.main;

import com.example.webtoon.dto.Paging;
import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceH;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface IMainDaoH {


    List<WebtoonVO> getGenreList(int genre);

    List<WebtoonVO> getNoticeList();

    WebtoonVO getWebtoon(int wseq);

    List<WebtoonVO> selectGenreList(
            @Param("genre") int genre,
            @Param("displayRow") int displayRow,
            @Param("startNum") int startNum
    );

    int getAllcount(int genre);

    List<WebtoonVO> getReadCount(@Param("genre")int genre);
}

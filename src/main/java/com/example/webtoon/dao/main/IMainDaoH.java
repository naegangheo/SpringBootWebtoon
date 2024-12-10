package com.example.webtoon.dao.main;

import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceH;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface IMainDaoH {


    List<WebtoonVO> getGenreList(int genre);

    List<HashMap<String, Object>> getNoticeList();

    WebtoonVO getWebtoon(int wseq);
}

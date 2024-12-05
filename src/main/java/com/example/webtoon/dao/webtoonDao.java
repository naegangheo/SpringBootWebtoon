package com.example.webtoon.dao;

import com.example.webtoon.dto.webtoonVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface webtoonDao {

    List<webtoonVO> selectBestList();

}

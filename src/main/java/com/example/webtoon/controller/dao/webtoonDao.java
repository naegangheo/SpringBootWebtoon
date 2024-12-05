package com.example.webtoon.controller.dao;

import com.example.webtoon.controller.dto.webtoonVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface webtoonDao {

    List<webtoonVO> selectBestList();

}

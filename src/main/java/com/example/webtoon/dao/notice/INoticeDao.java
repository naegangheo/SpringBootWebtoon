package com.example.webtoon.dao.notice;


import com.example.webtoon.dto.NoticeVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface INoticeDao {

    List<NoticeVO> getNoticeList();
}

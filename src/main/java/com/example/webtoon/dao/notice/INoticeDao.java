package com.example.webtoon.dao.notice;


import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.dto.Paging;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface INoticeDao {

    List<NoticeVO> selectNotice(Paging paging);

    int getAllcount();
}

package com.example.webtoon.dao.webtoon_detail;

import com.example.webtoon.dto.ReplyVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyDao {

    void insertReply(ReplyVO reply);

    List<ReplyVO> selectReplyList(int wseq);

    void updateReply(ReplyVO reply);

    void deleteReply(int reseq);
}

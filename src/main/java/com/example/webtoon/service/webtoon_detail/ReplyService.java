package com.example.webtoon.service.webtoon_detail;

import com.example.webtoon.dao.webtoon_detail.ReplyDao;
import com.example.webtoon.dto.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyService {

    @Autowired
    private ReplyDao rdao;




    public void addReply(ReplyVO reply) {
        rdao.insertReply(reply);
    }

    public List<ReplyVO> getReplyList(int wseq) {
        return rdao.selectReplyList(wseq);
    }


    public void updateReply(ReplyVO reply) {
        rdao.updateReply(reply);

    }


    public void deleteReply(int reseq) {
        rdao.deleteReply(reseq);
    }


    public ReplyVO getReplyById(int reseq) {

        return rdao.getReplyById(reseq);

    }

    public List<ReplyVO> getRepliesByWseq(int wseq) {

        return rdao.getRepliesByWseq(wseq);
    }
}

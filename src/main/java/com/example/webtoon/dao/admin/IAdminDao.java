package com.example.webtoon.dao.admin;

import com.example.webtoon.dto.*;
import jakarta.validation.Valid;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IAdminDao {

    AdminVO getAdmin(String adminid);


    List<WebtoonVO> adSelectWebtoon(Paging paging);

    List<QnaVO> adSelectQna(Paging paging);

    List<NoticeVO> adSelectNotice(Paging paging);



    int getAllcount();

    int getAllcountQna();


    int adAllCountMember();

    int getAllcountNotice();


    void adminWebtoonDelete(int wseq);


    WebtoonVO adGetWebtoon(int wseq);

    void adminUpdateWebtoon(WebtoonVO webtoonvo);


    // notice=============================
    void insertNotice(NoticeVO noticevo);

    NoticeVO selectNoticeOne(int nseq);

    void updateNotice(NoticeVO noticevo);

    void adminNoticeDelete(int nseq);

    QnaVO selectQnaOne(int qseq);

    List<QreplyVO> selectQreply(int qseq);

    void insertQreply(QreplyVO qreplyvo);

    void adminQreplyDelete(QreplyVO qreplyvo);

    // Q&A==============================================


}

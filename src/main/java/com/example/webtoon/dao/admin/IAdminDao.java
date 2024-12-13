package com.example.webtoon.dao.admin;

import com.example.webtoon.dto.*;
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



    /*mypage qna 작업*/
    List<QnaVO> selectQnaByUserId(@Param("userId") String userId, @Param("paging") Paging paging);
    int getCountQnaByUserId(@Param("userId") String userId);
    void insertQna(QnaVO qnaVO);
    void updateQna(QnaVO qnaVO);
    void deleteQna(@Param("qseq") int qseq, @Param("userid") String userid);
    /*mypage qna 끝*/
}

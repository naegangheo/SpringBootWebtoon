package com.example.webtoon.dao.member;

import com.example.webtoon.dto.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.constraints.NotEmpty;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface IMemberDao {
    MemberVO getMember(String userid);
    void insertMember(MemberVO mvo);
    void updateMember(MemberVO mvo);
    void deleteMember(@NotEmpty String userid);

    //제목이나 작가로 검색
    List<WebtoonVO> searchBySubjectOrUserid(@Param("keyword") String keyword);

    /*mypage qna 작업*/
    List<QnaVO> selectQnaByUserId(@Param("userId") String userId, @Param("paging") Paging paging);
    int getCountQnaByUserId(@Param("userId") String userId);
    void insertQna(QnaVO qnaVO);
    void updateQna(QnaVO qnaVO);
    void deleteQna(@Param("qseq") int qseq, @Param("userid") String userid);


    List<QreplyVO> selectRepliesByQseq(@Param("qseq") int qseq);
}


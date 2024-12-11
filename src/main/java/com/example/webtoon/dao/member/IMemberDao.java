package com.example.webtoon.dao.member;

import com.example.webtoon.dto.MemberVO;
import com.example.webtoon.dto.WebtoonVO;
import jakarta.validation.constraints.NotEmpty;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IMemberDao {
    MemberVO getMember(String userid);
    void insertMember(MemberVO mvo);
    void updateMember(MemberVO mvo);
    void deleteMember(@NotEmpty String userid);

//제목만
//    List<WebtoonVO> searchBySubject(String keyword);
    //제목이나 작가로 검색
    List<WebtoonVO> searchBySubjectOrUserid(@Param("keyword") String keyword);
}


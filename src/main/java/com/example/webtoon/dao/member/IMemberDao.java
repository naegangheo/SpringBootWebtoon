package com.example.webtoon.dao.member;

import com.example.webtoon.dto.MemberVO;
import jakarta.validation.constraints.NotEmpty;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {
    MemberVO getMember(String userid);
    void insertMember(MemberVO mvo);
    void updateMember(MemberVO mvo);
    void deleteMember(@NotEmpty String userid);
//    MemberVO getMemberByEmail(@NotEmpty String email);
//    MemberVO getMemberByPhone(@NotEmpty String phone);

}


package com.example.webtoon.dao.member;

import com.example.webtoon.dto.member.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberDao {
    MemberVO getMember(String userid);
    void insertMember(MemberVO mvo);
}


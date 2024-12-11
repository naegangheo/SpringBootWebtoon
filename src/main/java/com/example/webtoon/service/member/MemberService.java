package com.example.webtoon.service.member;

import com.example.webtoon.dao.member.IMemberDao;
import com.example.webtoon.dto.MemberVO;
import com.example.webtoon.dto.WebtoonVO;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    IMemberDao mdao;

    public void insertMember(@Valid MemberVO mvo) { mdao.insertMember( mvo ); }

    public MemberVO getMember(@NotEmpty String userid) { return mdao.getMember( userid ); }

    public void updateMember(MemberVO mvo) {
        mdao.updateMember(mvo);
    }

    public void deleteMember(@NotEmpty String userid) { mdao.deleteMember(userid);
    }




}

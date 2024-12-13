package com.example.webtoon.dao.admin;

import com.example.webtoon.dto.*;
import org.apache.ibatis.annotations.Mapper;

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


}

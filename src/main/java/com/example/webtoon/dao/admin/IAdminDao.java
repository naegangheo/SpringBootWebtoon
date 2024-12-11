package com.example.webtoon.dao.admin;

import com.example.webtoon.dto.AdminVO;
import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.dto.QnaVO;
import com.example.webtoon.dto.WebtoonVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminDao {

    AdminVO getAdmin(String adminid);


    List<WebtoonVO> adSelectWebtoon();

    List<QnaVO> adSelectQna();

    List<NoticeVO> adSelectNotice();
}

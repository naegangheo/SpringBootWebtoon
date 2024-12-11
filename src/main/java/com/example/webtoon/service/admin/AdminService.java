package com.example.webtoon.service.admin;

import com.example.webtoon.dao.admin.IAdminDao;
import com.example.webtoon.dto.AdminVO;
import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.dto.QnaVO;
import com.example.webtoon.dto.WebtoonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AdminService {

    @Autowired
    IAdminDao iadao;


    public AdminVO getAdmin(String adminid) {return iadao.getAdmin(adminid);
    }

    public List<WebtoonVO> adSelectWebtoon() {
        return iadao.adSelectWebtoon();
    }

    public List<QnaVO> adSelectQna() {
        return iadao.adSelectQna();
    }

    public List<NoticeVO> adSelectNotice() {
        return iadao.adSelectNotice();
    }
}

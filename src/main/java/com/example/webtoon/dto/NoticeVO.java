package com.example.webtoon.dto;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeVO {

    private int nseq;       // 공지사항 번호
    private String adminid; // 관리자 ID
    private String pwd;     // 관리자 비밀번호
    private String subject; // 공지사항 제목
    private String content; // 공지사항 내용
    private Date indate;    // 작성일 (기본값: 현재 시간)
}

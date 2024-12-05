package com.example.webtoon.controller.dto;

import lombok.Data;

import java.util.Date;

@Data
public class qnaVO {

    private int qseq;      // Q&A 번호
    private String userid; // 사용자 ID
    private String pwd;    // 비밀번호
    private String subject; // 제목
    private String content; // 내용
    private Date indate;   // 작성일 (기본값: 현재 시간)
}

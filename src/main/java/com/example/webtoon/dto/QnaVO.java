package com.example.webtoon.dto;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

@Data
public class QnaVO {

    private Integer qseq;     // Q&A 번호
    private String userid; // 사용자 ID
    private String pwd = "1";    // 비밀번호
    private String subject; // 제목
    private String content; // 내용
    private Timestamp indate;   // 작성일 (기본값: 현재 시간)
}

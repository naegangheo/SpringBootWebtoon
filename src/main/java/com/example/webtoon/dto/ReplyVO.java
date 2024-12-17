package com.example.webtoon.dto;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

@Data
public class ReplyVO {

    private int reseq; // 댓글 번호
    private int wseq; // 웹툰 번호
    private String userid;  // 사용자 ID
    private String rcontent; // 댓글 내용
    private Timestamp indate; // 등록 날짜

}

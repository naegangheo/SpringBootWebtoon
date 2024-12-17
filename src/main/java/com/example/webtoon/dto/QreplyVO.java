package com.example.webtoon.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class QreplyVO {
    private int qrseq;
    private int qseq;
    private String adminid;
    private String qrcontent;
    private Timestamp indate;
}

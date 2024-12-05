package com.example.webtoon.controller.dto;

import lombok.Data;

@Data
public class webtoonVO {
    // 웹툰 관련 속성
    private int wseq;            // 웹툰 순번
    private String userid;       // 회원 ID (작성자)
    private String subject;      // 제목
    private int genre;           // 장르 (예: 1 - 드라마, 2 - 판타지 등)
    private String content;      // 내용
    private int week;            // 업데이트 주 (예: 월요일 - 1, 화요일 - 2 등)
    private String image;        // 웹툰 이미지 1
    private String image2;       // 웹툰 이미지 2
    private String savefilename; // 저장된 이미지 파일 이름 1
    private String savefilename2;// 저장된 이미지 파일 이름 2
    private String indate;       // 작성일자
    private int readcountF;      // 여성 조회수
    private int readcountM;      // 남성 조회수
    private int readcountN;      // 전체 조회수(기타)

}

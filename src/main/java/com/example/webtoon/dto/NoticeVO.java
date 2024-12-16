package com.example.webtoon.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

@Data
public class NoticeVO {

    private int nseq;       // 공지사항 번호

    @NotEmpty(message="관리자 아이디를 입력하세요")
    @NotNull(message="관리자 아이디를 입력하세요")
    private String adminid; // 관리자 ID
    @NotEmpty(message="비밀번호를 입력하세요(게시글 수정 삭제시 필요합니다.)")
    @NotNull(message="비밀번호를 입력하세요(게시글 수정 삭제시 필요합니다.)")
    private String pwd;     // 수정 비밀번호
    @NotEmpty(message="제목을 입력하세요")
    @NotNull(message="제목을 입력하세요")
    private String subject; // 공지사항 제목
    @NotEmpty(message="내용을 입력하세요")
    @NotNull(message="내용을 입력하세요")
    private String content; // 공지사항 내용
    private Timestamp indate;    // 작성일 (기본값: 현재 시간)
}

package com.example.webtoon.controller.dto;

import lombok.Data;

@Data
public class adminVO {

    private String adminid;  // 관리자 ID
    private String pwd;      // 비밀번호
    private String name;     // 관리자 이름
    private String phone;    // 관리자 전화번호
    private String email;    // 관리자 이메일

}

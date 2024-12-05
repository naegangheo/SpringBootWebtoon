package com.example.webtoon.dto;

import lombok.Data;

@Data
public class memverVO {

    private String userid;   // 사용자 ID
    private String pwd;      // 비밀번호
    private String name;     // 이름
    private String gender;   // 성별
    private String email;    // 이메일
    private String phone;    // 전화번호
    private String address1; // 주소 1
    private String address2; // 주소 2
    private String address3; // 주소 3
    private String zip_num;  // 우편번호

}

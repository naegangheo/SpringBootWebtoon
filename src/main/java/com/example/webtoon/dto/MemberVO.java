package com.example.webtoon.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

@Data
public class MemberVO {
    @NotEmpty
    private String userid;
    @NotEmpty
    private String pwd;

    private String name;

    private String email;

    private String phone;

    private String gender;
}

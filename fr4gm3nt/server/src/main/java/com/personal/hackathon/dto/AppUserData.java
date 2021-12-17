package com.personal.hackathon.dto;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AppUserData {
    int id;
    private String email;
    private String password;
    private String fullName;
    private Date dob;
    private String gender;
    private String country;
    private String state;
    private String city;

}
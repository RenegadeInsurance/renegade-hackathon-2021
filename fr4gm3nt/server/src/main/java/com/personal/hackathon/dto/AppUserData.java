package com.personal.hackathon.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AppUserData {
    int id;
    private String email;
    private String password;
    private String name;
    private String age;
    private String gender;
    private String country;
    private String state;
    private String city;

}
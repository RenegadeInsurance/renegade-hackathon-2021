package com.personal.hackathon.model;

import com.personal.hackathon.auth.AuthUserDetails;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder

@Entity
@Table(name = "app_users")
public class AppUser {
    @Id
    @GeneratedValue
    private int id;

    private String name;

    private String age;

    private String gender;

    private String country;

    private String state;

    private String city;

    @OneToOne
    private AuthUserDetails auth;
}

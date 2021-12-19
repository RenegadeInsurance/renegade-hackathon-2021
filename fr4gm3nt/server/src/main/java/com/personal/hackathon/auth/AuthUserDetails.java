package com.personal.hackathon.auth;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AuthUserDetails {
    @Id
    @GeneratedValue
    private int id;

    @Column(unique = true)
    private String email;

    private String password;

    private String role;
}

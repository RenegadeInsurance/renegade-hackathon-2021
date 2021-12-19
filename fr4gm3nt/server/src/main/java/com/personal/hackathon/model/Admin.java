package com.personal.hackathon.model;

import com.personal.hackathon.auth.AuthUserDetails;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Admin {

    @Id
    @GeneratedValue
    private long id;

    @OneToOne
    private AuthUserDetails auth;
}

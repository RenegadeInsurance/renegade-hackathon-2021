package com.personal.hackathon.model;

import com.personal.hackathon.auth.AuthUserDetails;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

@Entity
public class Admin {

    @Id
    @GeneratedValue
    private long id;

    @OneToOne
    private AuthUserDetails auth;
}

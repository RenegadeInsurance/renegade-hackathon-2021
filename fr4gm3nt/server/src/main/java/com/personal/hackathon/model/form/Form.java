package com.personal.hackathon.model.form;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder

@Entity
public class Form {
    @Id
    @GeneratedValue
    private int id;

    private String formName;
}

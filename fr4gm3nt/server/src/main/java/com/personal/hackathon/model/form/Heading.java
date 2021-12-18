package com.personal.hackathon.model.form;

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
public class Heading {
    @Id
    @GeneratedValue
    private int id;

    private String title;

    @OneToOne
    private Form form;
}

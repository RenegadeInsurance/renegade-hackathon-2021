package com.personal.hackathon.model.field;

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
public class Heading {
    @Id
    @GeneratedValue
    private int id;

    private String title;
}

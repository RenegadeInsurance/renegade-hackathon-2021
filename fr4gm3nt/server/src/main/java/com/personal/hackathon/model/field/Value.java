package com.personal.hackathon.model.field;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder

@Entity
public class Value {
    @Id
    @GeneratedValue
    private int id;

    private String value;

    @ManyToOne
    private Field field;
}

package com.personal.hackathon.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

@Entity
public class RiskAssessmentType {

    @Id
    @GeneratedValue
    private int id;

    private String type;
}

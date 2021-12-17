package com.personal.hackathon.model;

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
public class RiskHeading {
    @Id
    @GeneratedValue
    private int id;

    private String heading;

    @OneToOne
    private RiskAssessmentType assessmentType;


}

package com.personal.hackathon.model;

import com.personal.hackathon.constants.RiskLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

@Entity
public class Question {

    @Id
    @GeneratedValue
    private int id;

    private String title;

    private String heading;

    @Enumerated
    private RiskLevel riskLevel;

    @OneToOne
    private RiskHeading riskHeading;

}

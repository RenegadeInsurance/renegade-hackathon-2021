package com.personal.hackathon.model.tree;

import lombok.*;

import javax.persistence.*;

@Entity
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RiskAssessmentQuestion {

    @Id
    @GeneratedValue
    private int id;

    @Column(name = "risk_question")
    @Lob
    private String question;
}

package com.personal.hackathon.model.v2;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RiskResult {

    @Id
    @GeneratedValue
    private int id;

    private String riskType;

    private int riskFactor;
}

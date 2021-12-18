package com.personal.hackathon.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class RiskData {
    private int headingId;
    private int fieldId;
    private String answer;
    private String riskIf;
    private String riskLevel;
}

package com.personal.hackathon.dto.v2;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class DynamicRiskData {
    private String answer;
    private String riskIf;
    private String riskLevel;
}

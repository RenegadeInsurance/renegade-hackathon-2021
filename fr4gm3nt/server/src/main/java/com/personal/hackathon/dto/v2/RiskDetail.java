package com.personal.hackathon.dto.v2;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class RiskDetail {

    private String title;

    private List<DynamicRiskData> data;
}

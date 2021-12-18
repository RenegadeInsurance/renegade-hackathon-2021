package com.personal.hackathon.dto.v2;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class DynamicFormSubmissionData {
    private int formId;
    
    private List<GeneralDetail> generalDetails;

    private List<RiskDetail> riskDetails;
}

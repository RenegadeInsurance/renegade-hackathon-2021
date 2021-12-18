package com.personal.hackathon.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FormSubmissionData {
    private String name;
    private String gender;
    private String country;
    private String state;
    private String age;
    private int formId;
    @JsonProperty("riskDetails")
    private List<RiskData> riskDataList;
}

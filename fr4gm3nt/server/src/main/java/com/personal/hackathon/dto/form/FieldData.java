package com.personal.hackathon.dto.form;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class FieldData {
    private int id;
    private String name;
    private String field;
    private boolean isRequired;
    private String type;
    private List<String> values;
    @JsonProperty("isRiskIndicator")
    private boolean isRiskIndicator;
    private String riskLevel;
    private String riskIf;
}

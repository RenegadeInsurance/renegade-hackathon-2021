package com.personal.hackathon.dto.v2;

import com.personal.hackathon.model.v2.RiskResult;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.Set;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class DynamicFormSubmissionOutput {
    private int id;

    private String formName;

    private Date submittedOn;

    private Set<GeneralDetail> generalDetails;

    private Set<RiskResult> riskResults;
}

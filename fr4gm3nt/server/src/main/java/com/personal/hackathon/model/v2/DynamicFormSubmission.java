package com.personal.hackathon.model.v2;

import com.personal.hackathon.dto.v2.GeneralDetail;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder

@Entity
public class DynamicFormSubmission {
    @Id
    @GeneratedValue
    private int id;

    @ManyToOne
    private DynamicForm form;

    private Date submittedOn;

    @OneToMany
    private Set<GeneralDetail> generalDetails;

    @OneToOne
    private RiskResult riskFactor;

}

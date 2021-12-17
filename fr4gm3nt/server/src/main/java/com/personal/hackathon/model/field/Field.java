package com.personal.hackathon.model.field;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Entity
public class Field {

    @Id
    @GeneratedValue
    private int id;

    private String name;
    private String field;
    private boolean isRequired;
    private String type;
    private boolean isRiskIndicator;
    private String riskLevel;
    private String riskIf;

    @OneToOne
    private Heading heading;
}

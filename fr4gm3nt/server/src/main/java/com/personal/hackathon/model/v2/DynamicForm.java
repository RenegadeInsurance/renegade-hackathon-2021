package com.personal.hackathon.model.v2;

import lombok.*;

import javax.persistence.*;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder

@Entity
@Table(name = "dynamic_form")
public class DynamicForm {
    @Id
    @GeneratedValue
    private int id;

    private String formName;

    private String createdDate;

    @Lob
    private String generalSection;

    @Lob
    private String riskSection;

}

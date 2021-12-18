package com.personal.hackathon.dto.v2;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString

@Entity
public class GeneralDetail {
    @Id
    @GeneratedValue
    private int id;

    private String label;

    private String value;

}

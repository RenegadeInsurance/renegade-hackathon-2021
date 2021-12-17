package com.personal.hackathon.dto.form;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FormData {
    private String heading;

    private List<FieldData> fields;
}

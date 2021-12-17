package com.personal.hackathon.dto.form;

import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class FormDataList {
    private String formName;
    private List<FormData> formData;
}


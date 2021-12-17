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
    private List<FormData> formData;
}


package com.personal.hackathon.service;

import com.personal.hackathon.dto.FormSubmissionData;
import com.personal.hackathon.dto.RiskData;
import com.personal.hackathon.dto.form.FormDataList;

import java.util.List;
import java.util.Map;

public interface FormService {
    int createForm(FormDataList formDataList);

    FormDataList retrieveForm(int formId);

    List<FormDataList> retrieveAllForms();

    Map<String, List<RiskData>> submitForm(FormSubmissionData data, String email);
}

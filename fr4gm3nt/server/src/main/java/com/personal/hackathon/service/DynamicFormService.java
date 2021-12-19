package com.personal.hackathon.service;

import com.personal.hackathon.dto.v2.DynamicFormSubmissionData;
import com.personal.hackathon.dto.v2.DynamicFormSubmissionOutput;

import java.util.List;

public interface DynamicFormService {
    DynamicFormSubmissionOutput submit(DynamicFormSubmissionData data);

    DynamicFormSubmissionOutput viewSubmission(int id);

    List<DynamicFormSubmissionOutput> viewAllSubmissionsOfForm(int formId);
}


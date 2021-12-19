package com.personal.hackathon.service.impl;

import com.personal.hackathon.dto.v2.DynamicFormSubmissionData;
import com.personal.hackathon.dto.v2.DynamicFormSubmissionOutput;
import com.personal.hackathon.exception.DataNotFound;
import com.personal.hackathon.model.v2.DynamicFormSubmission;
import com.personal.hackathon.model.v2.RiskResult;
import com.personal.hackathon.repo.v2.DynamicFormRepo;
import com.personal.hackathon.repo.v2.DynamicFormSubmissionRepo;
import com.personal.hackathon.repo.v2.GeneralDetailRepo;
import com.personal.hackathon.repo.v2.RiskResultRepo;
import com.personal.hackathon.service.DynamicFormService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.Date;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DynamicFormServiceImpl implements DynamicFormService {
    private final DynamicFormSubmissionRepo dynamicFormSubmissionRepo;
    private final DynamicFormRepo formRepo;
    private final GeneralDetailRepo generalDetailRepo;
    private final RiskResultRepo riskResultRepo;


    @Override
    @Transactional
    public DynamicFormSubmissionOutput submit(DynamicFormSubmissionData data) {

        var riskScoreMap = Map.of(
                "LOW", 0,
                "MODERATE", 2,
                "HIGH", 4
        );

        var lowRange = 0.5;
        var moderateRange = 2.5;

        var form = formRepo.findById(data.getFormId())
                .orElseThrow(() -> new DataNotFound("Form you are trying to submit does not exist"));

        Set<RiskResult> riskResultSet = new HashSet<>();

       for(var riskDetail : data.getRiskDetails()){
           double riskScore = 0.0;
           int count = 0;

           for(var riskData : riskDetail.getData()){
               if(riskData.getRiskIf().equalsIgnoreCase(riskData.getAnswer())){
                   riskScore += riskScoreMap.get(riskData.getRiskLevel());
                   count += 1;
               }
           }

           var riskFactor = "";

           if(riskScore/count < lowRange){
               riskFactor = "LOW";
           }else if(riskScore/count < moderateRange){
               riskFactor = "MODERATE";
           }else{
               riskFactor = "HIGH";
           }

           var riskResult = RiskResult.builder()
                   .riskTitle(riskDetail.getTitle())
                   .riskFactor(riskFactor)
                   .build();

           riskResultRepo.save(riskResult);

           riskResultSet.add(riskResult);

           count = 0;
       }

        System.out.println("\n\n"+riskResultSet+"\n\n");

        generalDetailRepo.saveAll(data.getGeneralDetails());

        var dynamicFormSubmission =
                DynamicFormSubmission.builder()
                        .form(form)
                        .submittedOn(Date.valueOf(LocalDate.now()))
                        .generalDetails(new HashSet<>(data.getGeneralDetails()))
                        .riskResults(riskResultSet)
                        .build();


        dynamicFormSubmissionRepo.save(dynamicFormSubmission);


        return DynamicFormSubmissionOutput.builder()
                .id(dynamicFormSubmission.getId())
                .formName(dynamicFormSubmission.getForm().getFormName())
                .riskResults(dynamicFormSubmission.getRiskResults())
                .generalDetails(dynamicFormSubmission.getGeneralDetails())
                .submittedOn(dynamicFormSubmission.getSubmittedOn())
                .build();
    }

    @Override
    public DynamicFormSubmissionOutput viewSubmission(int id) {
        var dynamicFormSubmission = dynamicFormSubmissionRepo.findById(id)
                .orElseThrow(() -> new DataNotFound("Form submission does not exist"));


        return DynamicFormSubmissionOutput.builder()
                .id(dynamicFormSubmission.getId())
                .formName(dynamicFormSubmission.getForm().getFormName())
                .riskResults(dynamicFormSubmission.getRiskResults())
                .generalDetails(dynamicFormSubmission.getGeneralDetails())
                .submittedOn(dynamicFormSubmission.getSubmittedOn())
                .build();
    }

    @Override
    @Transactional
    public List<DynamicFormSubmissionOutput> viewAllSubmissionsOfForm(int formId) {
        var dynamicFormSubmissions = dynamicFormSubmissionRepo.findByFormId(formId);

        return dynamicFormSubmissions.stream().map(
                dynamicFormSubmission ->  DynamicFormSubmissionOutput.builder()
                        .id(dynamicFormSubmission.getId())
                        .formName(dynamicFormSubmission.getForm().getFormName())
                        .riskResults(dynamicFormSubmission.getRiskResults())
                        .generalDetails(dynamicFormSubmission.getGeneralDetails())
                        .submittedOn(dynamicFormSubmission.getSubmittedOn())
                        .build()
        ).collect(Collectors.toList());

    }


}

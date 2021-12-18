package com.personal.hackathon.controller;

import com.personal.hackathon.model.tree.RiskAssessmentQuestion;
import com.personal.hackathon.repo.tree.RiskAssessmentQuestionRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/questions")
@RequiredArgsConstructor
public class RiskAssessmentQuestionController {

    private final RiskAssessmentQuestionRepo riskAssessmentQuestionRepo;

    @PostMapping
    public ResponseEntity<?> saveQuestion(@RequestBody RiskAssessmentQuestion question){
        System.out.println(question);
        return ResponseEntity.ok(riskAssessmentQuestionRepo.save(question));
    }
}

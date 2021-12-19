package com.personal.hackathon.controller;

import com.personal.hackathon.dto.FormSubmissionData;
import com.personal.hackathon.service.FormService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/api/submissions")
@RequiredArgsConstructor
public class FormSubmissionController {

    private final FormService formService;

    @PostMapping("/")
    public ResponseEntity<?> submitForm(Principal principal, @RequestBody FormSubmissionData data){
        return ResponseEntity.ok(formService.submitForm(data, ""));
    }
}

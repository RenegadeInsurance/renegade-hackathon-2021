package com.personal.hackathon.controller.v2;

import com.personal.hackathon.dto.v2.DynamicFormSubmissionData;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/dynamic-submissions")
public class DynamicFormSubmissionController {

    @PostMapping
    public ResponseEntity<?> submitForm(@RequestBody DynamicFormSubmissionData data){
        return ResponseEntity.ok(data);
    }

}

package com.personal.hackathon.controller.v2;

import com.personal.hackathon.dto.v2.DynamicFormSubmissionData;
import com.personal.hackathon.service.DynamicFormService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/dynamic-submissions")
@RequiredArgsConstructor
public class DynamicFormSubmissionController {

    private final DynamicFormService dynamicFormService;

    @PostMapping
    public ResponseEntity<?> submitForm(@RequestBody DynamicFormSubmissionData data){
        return ResponseEntity.ok(dynamicFormService.submit(data));
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getSubmission(@PathVariable int id){
        return ResponseEntity.ok(dynamicFormService.viewSubmission(id));
    }

    @GetMapping("")
    public ResponseEntity<?> getAllSubmissionsOfForm(@RequestParam int formId){
        return ResponseEntity.ok(dynamicFormService.viewAllSubmissionsOfForm(formId));
    }

}

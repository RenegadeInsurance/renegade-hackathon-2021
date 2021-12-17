package com.personal.hackathon.controller;

import com.personal.hackathon.dto.form.FormDataList;
import com.personal.hackathon.service.FormService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class FormController {

    private final FormService formService;

    @PostMapping("/forms")
    public ResponseEntity<?> createForm(@RequestBody FormDataList formDataList){
        System.out.println(formDataList);
        formService.createForm(formDataList);
        return ResponseEntity.ok("");
    }
}

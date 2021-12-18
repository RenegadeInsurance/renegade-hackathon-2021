package com.personal.hackathon.controller;

import com.personal.hackathon.dto.HttpResponse;
import com.personal.hackathon.dto.form.FormDataList;
import com.personal.hackathon.service.FormService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/forms")
@RequiredArgsConstructor
public class FormController {

    private final FormService formService;

    @PostMapping("/")
    public ResponseEntity<?> createForm(@RequestBody FormDataList formDataList){
        return ResponseEntity.ok(
                HttpResponse.of(formService.createForm(formDataList))
        );
    }

    @GetMapping("/")
    public ResponseEntity<?> getAllForms(){
        return ResponseEntity.ok(formService.retrieveAllForms());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getForm(@PathVariable int id){
        return ResponseEntity.ok(formService.retrieveForm(id));
    }



}

package com.personal.hackathon.controller.v2;

import com.personal.hackathon.exception.DataNotFound;
import com.personal.hackathon.model.v2.DynamicForm;
import com.personal.hackathon.repo.v2.DynamicFormRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.time.LocalDate;

@RestController
@RequestMapping("/api/dynamic-forms")
@RequiredArgsConstructor
public class DynamicFormController {
    private final DynamicFormRepo dynamicFormRepo;

    @PostMapping("/")
    public ResponseEntity<?> createForm(@RequestBody DynamicForm dynamicForm){
        dynamicForm.setCreatedDate(Date.valueOf(LocalDate.now()).toString());
        return ResponseEntity.ok(dynamicFormRepo.save(dynamicForm));
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getForm(@PathVariable int id){
        var form = dynamicFormRepo.findById(id)
                .orElseThrow(() -> new DataNotFound("Form does not exist"));

        return ResponseEntity.ok(form);
    }

    @GetMapping("")
    public ResponseEntity<?> getAllForms(){
        return ResponseEntity.ok(dynamicFormRepo.findAll());
    }
}

package com.personal.hackathon.controller;

import com.personal.hackathon.dto.AppUserData;
import com.personal.hackathon.dto.HttpResponse;
import com.personal.hackathon.service.AppUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/app-users")
@RequiredArgsConstructor
public class AppUserController {

    private final AppUserService appUserService;

    @PostMapping("/register")
    public ResponseEntity<?> create(@Valid @RequestBody AppUserData data){
        return ResponseEntity.ok(
                HttpResponse.of(appUserService.register(data))
        );
    }



}

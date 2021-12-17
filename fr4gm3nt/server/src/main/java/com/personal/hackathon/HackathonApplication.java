package com.personal.hackathon;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@RequiredArgsConstructor
public class HackathonApplication {
    public static void main(String[] args) {
        SpringApplication.run(HackathonApplication.class, args);
    }
}

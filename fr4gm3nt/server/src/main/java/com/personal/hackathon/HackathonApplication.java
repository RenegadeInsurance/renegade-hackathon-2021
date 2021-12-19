package com.personal.hackathon;

import com.personal.hackathon.auth.AuthUserDetails;
import com.personal.hackathon.auth.AuthUserDetailsRepo;
import com.personal.hackathon.constants.Roles;
import com.personal.hackathon.model.Admin;
import com.personal.hackathon.repo.AdminRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.transaction.Transactional;

@SpringBootApplication
@RequiredArgsConstructor
public class HackathonApplication implements CommandLineRunner {
    private final AdminRepo adminRepo;
    private final AuthUserDetailsRepo authUserDetailsRepo;

    public static void main(String[] args) {
        SpringApplication.run(HackathonApplication.class, args);
    }

    @Override
    @Transactional
    public void run(String... args) throws Exception {
//      var authDetails = AuthUserDetails.builder()
//              .email("admin@admin.com")
//              .password("123")
//              .role(Roles.ROLE_ADMIN)
//              .build();
//
//      authUserDetailsRepo.save(authDetails);
//
//      adminRepo.save(
//        Admin.builder()
//                .auth(authDetails)
//                .build()
//      );

    }
}

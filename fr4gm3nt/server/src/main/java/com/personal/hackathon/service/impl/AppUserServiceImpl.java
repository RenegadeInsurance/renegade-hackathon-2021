package com.personal.hackathon.service.impl;

import com.personal.hackathon.auth.AuthUserDetails;
import com.personal.hackathon.auth.AuthUserDetailsRepo;
import com.personal.hackathon.constants.Roles;
import com.personal.hackathon.dto.AppUserData;
import com.personal.hackathon.exception.BadRequest;
import com.personal.hackathon.model.AppUser;
import com.personal.hackathon.repo.AppUserRepo;
import com.personal.hackathon.service.AppUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@RequiredArgsConstructor
public class AppUserServiceImpl implements AppUserService {

    private final AppUserRepo appUserRepo;
    private final AuthUserDetailsRepo authUserDetailsRepo;

    @Override
    @Transactional
    public long create(AppUserData data) {
        var optionalAppUser = appUserRepo.findByAuthEmail(data.getEmail());

        if(optionalAppUser.isPresent()){
            throw new BadRequest("User already exists");
        }

        var appUserAuth = AuthUserDetails.builder()
                .email(data.getEmail())
                .password(data.getPassword())
                .role(Roles.ROLE_USER)
                .build();

        authUserDetailsRepo.save(appUserAuth);

        var appUser = appUserRepo.save(
                AppUser.builder()
                        .fullName(data.getFullName())
                        .dob(data.getDob())
                        .gender(data.getGender())
                        .country(data.getCountry())
                        .state(data.getState())
                        .city(data.getCity())
                        .auth(appUserAuth)
                        .build()
        );

        return appUser.getId();
    }
}

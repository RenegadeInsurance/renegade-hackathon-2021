package com.personal.hackathon.service;

import com.personal.hackathon.dto.AppUserData;
import com.personal.hackathon.model.AppUser;

public interface AppUserService {
    long register(AppUserData data);
}

package com.personal.hackathon.repo;

import com.personal.hackathon.model.AppUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepo extends JpaRepository<AppUser, Long> {
}

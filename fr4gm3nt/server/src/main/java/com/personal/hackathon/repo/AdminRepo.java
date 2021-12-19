package com.personal.hackathon.repo;

import com.personal.hackathon.model.Admin;
import com.personal.hackathon.model.AppUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepo extends JpaRepository<Admin, Long> {
}

package com.personal.hackathon.auth;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AuthUserDetailsRepo extends JpaRepository<AuthUserDetails, Integer> {

    Optional<AuthUserDetails> findByEmail(String email);
}

package com.personal.hackathon.repo;

import com.personal.hackathon.model.RiskHeading;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RiskHeadingRepo extends JpaRepository<RiskHeading, Integer> {
}

package com.personal.hackathon.repo;

import com.personal.hackathon.model.RiskAssessmentType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RiskAssessmentTypeRepo extends JpaRepository<RiskAssessmentType, Integer> {
}

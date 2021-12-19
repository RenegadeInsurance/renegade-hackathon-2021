package com.personal.hackathon.repo.v2;

import com.personal.hackathon.model.v2.RiskResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RiskResultRepo extends JpaRepository<RiskResult, Integer> {
}

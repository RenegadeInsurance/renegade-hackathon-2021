package com.personal.hackathon.repo.tree;

import com.personal.hackathon.model.tree.RiskAssessmentQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RiskAssessmentQuestionRepo extends JpaRepository<RiskAssessmentQuestion, Integer> {
}

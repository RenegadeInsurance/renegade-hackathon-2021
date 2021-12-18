package com.personal.hackathon.repo.v2;

import com.personal.hackathon.model.v2.DynamicFormSubmission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DynamicFormSubmissionRepo extends JpaRepository<DynamicFormSubmission, Integer> {
    List<DynamicFormSubmission> findByFormId(int formId);
}

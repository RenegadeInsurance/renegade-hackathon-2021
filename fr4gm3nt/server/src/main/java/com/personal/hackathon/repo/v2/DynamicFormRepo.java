package com.personal.hackathon.repo.v2;

import com.personal.hackathon.model.v2.DynamicForm;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DynamicFormRepo extends JpaRepository<DynamicForm, Integer> {
}

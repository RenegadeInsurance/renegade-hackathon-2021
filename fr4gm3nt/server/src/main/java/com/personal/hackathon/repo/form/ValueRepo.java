package com.personal.hackathon.repo.form;

import com.personal.hackathon.model.form.Value;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ValueRepo extends JpaRepository<Value, Integer> {
    List<Value> findByFieldId(int fieldId);
}

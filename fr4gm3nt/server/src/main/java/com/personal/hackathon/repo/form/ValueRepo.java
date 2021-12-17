package com.personal.hackathon.repo.form;

import com.personal.hackathon.model.field.Value;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ValueRepo extends JpaRepository<Value, Integer> {
}

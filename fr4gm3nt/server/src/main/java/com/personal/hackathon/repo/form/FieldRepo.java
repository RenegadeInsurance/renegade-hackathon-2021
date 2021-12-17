package com.personal.hackathon.repo.form;

import com.personal.hackathon.model.form.Field;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FieldRepo extends JpaRepository<Field, Integer> {
}

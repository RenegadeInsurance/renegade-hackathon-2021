package com.personal.hackathon.repo.form;

import com.personal.hackathon.model.form.Field;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FieldRepo extends JpaRepository<Field, Integer> {
    List<Field> findByHeadingId(int headingId);
    Field findByIdAndHeadingId(int fieldId, int headingId);

}

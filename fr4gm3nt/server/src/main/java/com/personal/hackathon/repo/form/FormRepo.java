package com.personal.hackathon.repo.form;

import com.personal.hackathon.model.form.Form;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FormRepo extends JpaRepository<Form, Integer> {
}

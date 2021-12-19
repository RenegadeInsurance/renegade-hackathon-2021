package com.personal.hackathon.repo.form;

import com.personal.hackathon.model.form.Heading;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HeadingRepo extends JpaRepository<Heading, Integer> {

    List<Heading> findByFormId(int formId);
}

package com.personal.hackathon.repo.v2;

import com.personal.hackathon.dto.v2.GeneralDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GeneralDetailRepo extends JpaRepository<GeneralDetail, Integer> {
}

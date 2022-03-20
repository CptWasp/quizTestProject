package com.quiz.quiz.repo;

import com.quiz.quiz.entity.QuestionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepo extends JpaRepository<QuestionEntity, Long> {

}

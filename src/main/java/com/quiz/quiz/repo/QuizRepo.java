package com.quiz.quiz.repo;

import com.quiz.quiz.entity.QuizEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuizRepo extends JpaRepository<QuizEntity, Long> {

    //Page<QuizEntity> findAll(Pageable pageable);
    List<QuizEntity> findAll();

}

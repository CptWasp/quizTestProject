package com.quiz.quiz.repo;

import com.quiz.quiz.entity.QuizEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface QuizRepo extends JpaRepository<QuizEntity, Long> {

    //Page<QuizEntity> findAll(Pageable pageable);
    List<QuizEntity> findAll();

    void deleteById(Long quiz);

    QuizEntity findOneById(Long id);

}

package com.quiz.quiz.controller;

import com.quiz.quiz.entity.QuestionEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class AdminRestController {


    @PostMapping("/saveQuestion")
    public boolean saveQuestion(@RequestParam("quizId") Long quizId, @RequestParam("questionText") String questionText,
                                @RequestParam("questionType") String questionType, @RequestParam("answersArray") String answersArray){

        QuestionEntity questionEntity = new QuestionEntity(questionText, Byte.parseByte(questionType), answersArray, quizId);




        return true;
    }


}

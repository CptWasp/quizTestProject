package com.quiz.quiz.controller;

import com.quiz.quiz.entity.QuizEntity;
import com.quiz.quiz.repo.QuizRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

    @Autowired
    public QuizRepo quizRepo;






    @GetMapping("/quizList")
    public String mainPage(Model model){
        Iterable<QuizEntity> quizList = quizRepo.findAll();
        model.addAttribute("quizList", quizList);
        return "adminMainPage";
    }




    @PostMapping("/createQuiz")
    public String showQuizList(@RequestParam("name") String quizName, @RequestParam("dateStart") String dateStart,
                               @RequestParam("dateEnd") String dateEnd, @RequestParam("annotation") String annotation,
                               Model model){


        if(quizName != "" && dateStart != "" && dateEnd != "" && annotation != ""){

            QuizEntity quiz = new QuizEntity(quizName, dateStart, dateEnd, annotation);
            quizRepo.save(quiz);
            model.addAttribute("alert", "Опрос создан. Ура!");
            model.addAttribute("alertType", "primary");
        }else {
            model.addAttribute("alert", "Ошибка! Проверьте заполненные поля");
            model.addAttribute("alertType", "danger");
        }

        Iterable<QuizEntity> quizList = quizRepo.findAll();
        model.addAttribute("quizList", quizList);

        return "adminMainPage";
    }





}

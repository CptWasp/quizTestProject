package com.quiz.quiz.controller;

import com.quiz.quiz.entity.QuizEntity;
import com.quiz.quiz.repo.QuizRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

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


    @GetMapping("/deleteQuiz/{quiz}")
    public String deleteQuiz(@PathVariable Long quiz){
        quizRepo.deleteById(quiz);

        return "redirect:/quizList";
    }

    @GetMapping("/")
    public String redirectToQuiz(){
        return "redirect:/quizList";
    }


    @GetMapping("/redactQuiz/{quiz}")
    public String redactQuiz(@PathVariable Long quiz, Model model){
        QuizEntity quizEntity = quizRepo.findOneById(quiz);

        model.addAttribute("quizEntity", quizEntity);
        return "quizEntityRedacting";
    }


    @PostMapping("/saveRedactedQuiz")
    public String saveRedactedQuiz(@RequestParam("id") Long quiz, @RequestParam("name") String name,
                                   @RequestParam("dateStart") String dateStart, @RequestParam("dateEnd") String dateEnd,
                                   @RequestParam("annotation") String annotation){
        QuizEntity quizEntity = quizRepo.findOneById(quiz);
        quizEntity.setName(name);
        quizEntity.setDateStart(dateStart);
        quizEntity.setDateEnd(dateEnd);
        quizEntity.setAnnotation(annotation);

        quizRepo.save(quizEntity);

        return "redirect:/quizList";
    }


}

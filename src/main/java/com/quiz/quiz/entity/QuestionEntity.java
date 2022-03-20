package com.quiz.quiz.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class QuestionEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String questionText;
    private byte answerType;
    private String answers;

//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "quiz_id")
    private Long quizId;


    public QuestionEntity() {
    }

    public QuestionEntity(String questionText, byte answerType, String answers, Long quizId) {
        this.questionText = questionText;
        this.answerType = answerType;
        this.answers = answers;
        this.quizId = quizId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public byte getAnswerType() {
        return answerType;
    }

    public void setAnswerType(byte answerType) {
        this.answerType = answerType;
    }

    public String getAnswers() {
        return answers;
    }

    public void setAnswers(String answers) {
        this.answers = answers;
    }

    public Long getQuizId() {
        return quizId;
    }

    public void setQuizId(Long quizId) {
        this.quizId = quizId;
    }
}

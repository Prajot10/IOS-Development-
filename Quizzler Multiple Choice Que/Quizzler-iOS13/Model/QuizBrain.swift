//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Prajot Awale on 02/11/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    
    var questionNumber = 0
    var Score = 0
    
    
    let quiz = [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")]


    func getQuestiontext() -> String{
        return quiz[questionNumber].Que
    }
    
    func getAnswers() -> [String]{
        return quiz[questionNumber].Answer
        
    }
    
    func getScore() -> Int{
        return Score
    }
    mutating func nextQuestion(){
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        }else{
            questionNumber = 0
            Score = 0
        }
    }
    
    func progressBar() -> Float{
        
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    mutating func checkAnswer(userAnswer : String) -> Bool{
        if userAnswer == quiz[questionNumber].rightAnswer{
            Score += 1
            return true
        }else{
            return false
        }
        
    }
    
    
    
    
}

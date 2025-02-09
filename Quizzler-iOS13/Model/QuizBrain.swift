//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ryan Henzell-Hill on 15/06/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionIndex = 0
    var userScore = 0
    
    mutating func validateAnswer(answer: String) -> Bool {
        if quiz[questionIndex].answer == answer {
            userScore += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionIndex].text
    }
    
    func getProgress() -> Float {
        return Float(questionIndex + 1) / Float(quiz.count)
    }
    
    mutating func getNextQuestion() {
        if questionIndex == quiz.count - 1 {
            questionIndex = 0
            userScore = 0
        } else {
            questionIndex += 1
        }
    }
    
    func getUserScore() -> Int {
        return userScore
    }
    
    func getQuestionOptions() -> [String] {
        return quiz[questionIndex].options
    }
}

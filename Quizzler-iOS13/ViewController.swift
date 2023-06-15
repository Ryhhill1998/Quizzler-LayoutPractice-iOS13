//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    let quiz = [
        ["question": "4 + 2 = 6?", "answer": "True"],
        ["question": "5 - 3 > 1?", "answer": "True"],
        ["question": "3 + 8 < 10?", "answer": "False"]
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionText()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answer = sender.currentTitle!
        print(answer)
        print("Answer correct: \(validateAnswer(answer: answer))")
        questionIndex += 1
        updateQuestionText()
    }
    
    func updateQuestionText() {
        questionLabel.text = quiz[questionIndex]["question"]
    }
    
    func validateAnswer(answer: String) -> Bool {
        return quiz[questionIndex]["answer"] == answer
    }
}


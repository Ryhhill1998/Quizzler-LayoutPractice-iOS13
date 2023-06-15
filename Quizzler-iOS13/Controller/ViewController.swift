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
    
    let quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answer = sender.currentTitle!
        
        if quizBrain.validateAnswer(answer: answer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        questionIndex += 1
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            self.updateQuestion()
        }
    }
    
    func updateQuestion() {
        if questionIndex == quiz.count {
            questionIndex = 0
        }
        
        questionLabel.text = quiz[questionIndex].text
        
        self.trueButton.backgroundColor = UIColor.clear
        self.falseButton.backgroundColor = UIColor.clear
        
        progressBar.progress = (Float(questionIndex) + 1) / Float(quiz.count)
    }
}


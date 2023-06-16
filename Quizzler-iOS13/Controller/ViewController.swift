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
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let answer = sender.currentTitle!
        let answerIsCorrect = quizBrain.validateAnswer(answer: answer)
        
        if answerIsCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.getNextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            self.updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getUserScore())"
        
        let answerOptions = quizBrain.getQuestionOptions()
        choice1Button.setTitle(answerOptions[0], for: .normal)
        choice2Button.setTitle(answerOptions[1], for: .normal)
        choice3Button.setTitle(answerOptions[2], for: .normal)
        
        self.choice1Button.backgroundColor = UIColor.clear
        self.choice2Button.backgroundColor = UIColor.clear
        self.choice3Button.backgroundColor = UIColor.clear
    }
}


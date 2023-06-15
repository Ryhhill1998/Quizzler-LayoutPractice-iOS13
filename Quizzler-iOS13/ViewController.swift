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
    
    let questions = [
        "4 + 2 = 6?",
        "5 - 3 > 1?",
        "3 + 8 < 10?"
    ]
    
    var currentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionText()
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        currentQuestion += 1
        updateQuestionText()
    }
    
    func updateQuestionText() {
        questionLabel.text = questions[currentQuestion]
    }
}


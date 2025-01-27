//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Score: UILabel!
    
    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet weak var progessBar: UIProgressView!
    @IBOutlet weak var Choice1: UIButton!
    @IBOutlet weak var Choice2: UIButton!
    @IBOutlet weak var Choice3: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUi()
    }

    
    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let gotRightAnswer = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if gotRightAnswer{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
            
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUi(){
        
        Question.text = quizBrain.getQuestiontext()
        
        let answerChoices = quizBrain.getAnswers()
                Choice1.setTitle(answerChoices[0], for: .normal)
                Choice2.setTitle(answerChoices[1], for: .normal)
                Choice3.setTitle(answerChoices[2], for: .normal)
        
        progessBar.progress = quizBrain.progressBar()
        
        Score.text = "Score: \(quizBrain.getScore())"
        
        
        Choice1.backgroundColor = UIColor.clear
        Choice2.backgroundColor = UIColor.clear
        Choice3.backgroundColor = UIColor.clear
        
        
        
        
    }
    
    
    

}


//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //정답 체크
        let userAnswer = sender.currentTitle! //True or False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //이벤트 지연을 위한 함수
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    //viewDidLoad는 앱이 실행될때 최초로 변경되기 때문에 업데이트하는 함수가 필요하다.
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText() // <- quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear  
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()// <- Float(questionNumber + 1) / Float(quiz.count)
    }
    
    
}

//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = ["Soft": 5, "Medium": 8, "Hard":12]
    //    let softTime = 5
    //    let mediumTime = 8
    //    let hardTime = 12
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    //    var secondsRemaining = 60
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //reset timer
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        //reset progressBar and time and Title
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        //        print(eggTime[hardness]!)
        
        //        if hardness == "Soft"{
        //            print(softTime)
        //        }else if hardness == "Medium"{
        //            print(mediumTime)
        //        }else if hardness == "Hard"{
        //            print(hardTime)
        //        }else{
        //            print("Error")
        //        }
        totalTime = eggTime[hardness]! * 60 //MARK:수정
        //        print(totalTime)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = percentageProgress
            print(percentageProgress)
        }else {
            timer.invalidate()
            titleLabel.text = "DONE!!"
            playSound()
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

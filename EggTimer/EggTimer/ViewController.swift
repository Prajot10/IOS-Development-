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
    
    var player: AVAudioPlayer!

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft":3, "Medium":4, "Hard":7]
    
    
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0
        
        secondPassed = 0
        
        titleLabel.text = "Making \(hardness) egg"
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }
    
    
    @objc func updateTimer() {
        //example functionality
        if secondPassed <= totalTime {
            
            progressBar.progress = Float(secondPassed)/Float(totalTime)
            
            print(Float(secondPassed)/Float(totalTime))
            secondPassed += 1
        }else{
            timer.invalidate()
            titleLabel.text = "Done!!"
            playSound()
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}

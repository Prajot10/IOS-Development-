//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Declare the outlets of dice
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var leftDiceNumber = Int.random(in: 0...5)
    var rightDiceNumber = Int.random(in: 0...5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disolay face of dice aftre load of app
        // what.who = value
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        print("Button Tapped")
        
        let diceArray = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]
        
        diceImageView1.image = diceArray[Int.random(in: 0...5)]
        diceImageView2.image = diceArray[Int.random(in: 0...5)]
        
        
    }
    
}


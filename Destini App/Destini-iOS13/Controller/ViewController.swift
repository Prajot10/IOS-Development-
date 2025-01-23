//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyNumber = 0
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUi()

    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userchoice = sender.currentTitle!
        
        storyBrain.nextStory(userChoice: userchoice)
        
        updateUi()
        
        
    }
    
    
    
    func updateUi(){
        
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getchoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getchoice2(), for: .normal)
        
    }

}


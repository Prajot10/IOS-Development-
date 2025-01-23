//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Prajot Awale on 5/11/2023.
//  Copyright © 2023 Prajot Awale. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        let slideHeight = String(format:"%.2f",sender.value)
        
        heightLabel.text = "\(slideHeight)m"
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        let slideWeight = String(format:"%.0f",sender.value)
        
        weightLabel.text = "\(slideWeight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmivalue = calculatorBrain.getBMIValue()
            
            destinationVC.advice = calculatorBrain.getAdvice()
            
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

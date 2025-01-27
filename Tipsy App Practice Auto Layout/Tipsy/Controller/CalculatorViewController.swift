//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    var Tip = 0.10
    
    var exactTip = 0.0
    
    var peopleNumber = 0
    
    var bill = 0.0
    
    var finalResult = "0.0"

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billTextField.becomeFirstResponder()
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        
        sender.isSelected = true
        
        print(sender.currentTitle!)
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleWithoutPercentageSign = String(buttonTitle.dropLast())
        
        let buttonTitleAsNumber = Double(buttonTitleWithoutPercentageSign)!
        
        Tip = buttonTitleAsNumber / 100
        
        
        
        
    }
    
    

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format:"%.0f", sender.value)
        
        peopleNumber = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billTotal = billTextField.text!
        
        if billTotal != ""{
            bill = Double(billTotal)!
        }
        
        exactTip = bill * Tip
        
        let result = (bill + exactTip) / Double(peopleNumber)
        
        finalResult = String(format: "%.2f", result)
        
        print(finalResult)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let DestinationVC = segue.destination as! ResultViewController
            
            DestinationVC.Split = finalResult
            DestinationVC.tip = Int(Tip * 100)
            DestinationVC.splitBtpeople = peopleNumber
        }
    }
    
    
    
}


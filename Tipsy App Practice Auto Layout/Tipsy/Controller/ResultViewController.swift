//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Prajot Awale on 10/11/23.
//  Copyright © 2023 Prajot Awale. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var Split = "0.0"
    var tip = 10
    var splitBtpeople = 2
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = Split
        settingLabel.text = "Split between \(splitBtpeople) with \(tip)% tip "
        
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

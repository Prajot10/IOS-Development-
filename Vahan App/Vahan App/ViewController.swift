//
//  ViewController.swift
//  Vahan App
//
//  Created by Prajot Awale on 08/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LogINPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToSignup", sender: self)
    }
    
    
    @IBAction func SignUPPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func ContinueWithoutAccountPressed(_ sender: UIButton) {
    }
}


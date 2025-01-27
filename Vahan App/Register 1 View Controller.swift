//
//  Register 1 View Controller.swift
//  Vahan App
//
//  Created by Prajot Awale on 12/11/23.
//

import UIKit

class Register_1_View_Controller: UIViewController {

    @IBOutlet weak var bottomBlock: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bottomBlock.layer.shadowColor = UIColor.black.cgColor
        bottomBlock.layer.shadowRadius = 2
        bottomBlock.layer.shadowOpacity = 0.5
        bottomBlock.layer.shadowOffset = CGSize(width: 0, height: 0)
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

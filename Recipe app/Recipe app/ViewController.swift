//
//  ViewController.swift
//  Recipe app
//
//  Created by Prajot Awale on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var recipeView: UILabel!
    
    @IBOutlet weak var ingridentView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let nonVegrecipearry = [UIImage(named: "eggFry"), UIImage(named: "Scrambledegg")]
    
    let vegrecipearry = [UIImage(named: "Salad"), UIImage(named: "Maggie")]
    
    

    @IBAction func veButtonPressed(_ sender: UIButton) {
        recipeImageView.image = vegrecipearry[Int.random(in: 0...1)]
        
        if recipeImageView.image == UIImage(named: "Maggie") {
            recipeView.text = "As we all know Maggi is a very popular food among students in hostels. All you need is a bowl of water in which you can dip the Maggi and heat it for 2 minutes. You can add any veggies or spices of your choice for that extra zing. Now, your noodles are ready to please your taste buds."
        } else if recipeImageView.image == UIImage(named: "Salad"){
            recipeView.text = "In a hostel, you can prepare the sprout salad in your style. Preparing this food item hardly takes 10 mins. You need to take some sprouted Kala Chana or some sprouted green gram, add some chopped vegetables, red chili powder, salt, and a dash of lemon on it. Mouthwatering, isn’t it?"
        }
        
    }
    
    @IBAction func nonVegButtobPressed(_ sender: Any) {
        
        recipeImageView.image = nonVegrecipearry[Int.random(in: 0...1)]
        
        if recipeImageView.image == UIImage(named: "eggFry") {
            recipeView.text = "Half-fry eggs are a very easy-to-cook food and have many benefits to your health. Half-fry eggs help in increasing the good cholesterol in the blood. You can prepare this healthy cuisine as your breakfast."
        }else if recipeImageView.image == UIImage(named: "Scrambledegg"){
            recipeView.text = "To make scrambled eggs, all you need is eggs, milk or water, butter or extra-virgin olive oil, salt and pepper. Make scrambled eggs within 15 minutes in your hostel room and enjoy this mouth-watering food as a healthy breakfast."
        }
    }
    
    
}


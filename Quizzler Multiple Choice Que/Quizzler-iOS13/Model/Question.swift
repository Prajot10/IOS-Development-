//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Prajot Awale on 02/11/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation


struct Question{
    var Que : String
    var Answer : [String]
    var rightAnswer : String
    
    init(q: String, a: [String], correctAnswer: String) {
        Que = q
        Answer = a
        rightAnswer = correctAnswer
    }
    
}

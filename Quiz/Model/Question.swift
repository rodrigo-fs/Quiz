//
//  Question.swift
//  Quiz
//
//  Created by Rodrigo França on 03/03/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import Foundation


class Question {
    var text : String
    var answer : Bool
    
    init(text : String, answer : Bool) {
        self.text = text
        self.answer = answer
    }
}

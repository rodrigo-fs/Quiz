//
//  SeedData.swift
//  Quiz
//
//  Created by Rodrigo França on 03/03/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import Foundation

class SeedData{
    
    fileprivate var questions  = [Question] ()
    
    static let sharedInstance = SeedData()
    
    private init(){
        createDataMock()
    }
    
    private func createDataMock(){
        
        addQuestion(text: "O rodrigo é bonito?", answer: true)
        addQuestion(text: "o rodrigo é cheiroso?", answer: true)
        addQuestion(text: "o rodrigo namora?", answer: false)
    }
    
    
    func addQuestion(text: String, answer: Bool){
        questions.append(Question(text: text, answer: answer))
    }
    
    func getAllQuestions() -> [Question]{
        return questions
    }
    
    func getQuestionAtPosition(index: Int) -> Question {
        return questions[index]
    }
    
    func getNumberOfQuestions() -> Int{
        return questions.count
    }
    
    func editQuestionAtPosition(index: Int, text: String, answer: Bool){
        questions[index] = Question(text: text, answer: answer)
    }
}

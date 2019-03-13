//
//  QuizViewController.swift
//  Quiz
//
//  Created by Rodrigo França on 12/03/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var actualQuestion : Question?
    var choosedAnswer : Bool = false
    var actualIndex: Int = 0
    var correctAnswers: Int = 0
    var data: SeedData!
    var numberOfQuestions: Int = 0
    
    
    //TODO: Add ProgressBar
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfQuestions = data.getNumberOfQuestions()
        updateScore()
        loadQuestion()
        
        // Do any additional setup after loading the view.
    }
    
    private func loadQuestion(){
        UnselectButtons()
        actualQuestion = data.getQuestionAtPosition(index: actualIndex)
        questionLabel.text = actualQuestion?.text
    }
    
    private func UnselectButtons(){
        self.Unselect(button: trueButton)
        self.Unselect(button: falseButton)
    }
    
    private func getButtonAnswer(button : UIButton){
        choosedAnswer = button.titleLabel?.text == "True"
    }
    
    private func checkAnswer(button: UIButton){
        getButtonAnswer(button: button)
        //var x = actualQuestion?.answer
        //var y = choosedAnswer == x
        showMessageToAnswer(isCorrect: choosedAnswer == actualQuestion?.answer)
    }
    //TODO: Change ProgressHUD
    private func showMessageToAnswer(isCorrect : Bool){
        //ProgressHUD.statusColor(UIColor.black)
        if isCorrect{
            ProgressHUD.showSuccess()
            correctAnswers += 1
        }
        else{
            ProgressHUD.showError()
        }
    }
    
    private func updateScore(){
        scoreLabel.text = String("\(correctAnswers)/\(numberOfQuestions)")
    }
    
    private func loadNextQuestion(){
        actualIndex += 1
        if actualIndex < numberOfQuestions {
            loadQuestion()
        }
        else{
            showEndMessage()
        }
    }
    //TODO: Create restart quiz option
    private func showEndMessage(){
        let alert = UIAlertController(title: "End", message: "You correctly answered \(String(describing: scoreLabel.text!)) questions.", preferredStyle: .alert)
        let endAction = UIAlertAction(title: "Ok", style: .default, handler: {
            (UIAlertAction) in
            _ = self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(endAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func answerPressed(_ sender: Any) {
        let button = sender as! UIButton
        self.Select(button: button)
        checkAnswer(button: button)
        updateScore()
        loadNextQuestion()
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

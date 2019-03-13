//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Rodrigo França on 11/03/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var data : SeedData?
    var questionSelected : Question?
    var questionAnswer : Bool?
    var selectedButton : UIButton?
    var questionIndex : Int?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var trueButtton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let question = questionSelected{
            loadQuestion(question: question)
        }
    }
    
    private func loadQuestion(question: Question){
        questionTextField.text = question.text
        switch question.answer{
        case true: paintButton(button: trueButtton)
        case false: paintButton(button: falseButton)
        }
    }

    
    private func paintButton(button: UIButton){
        switch button.backgroundColor {
            case UIColor.white: paintButtonToSelected(button: button)
            case UIColor.black: paintButtonToUnselected(button: button)
            default: break
        }
    }
    
    private func paintButtonToSelected(button: UIButton){
        selectedButton = button
        setQuestionAnswer(button: selectedButton)
        button.backgroundColor = UIColor.black
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        //button.titleLabel?.textColor = UIColor.white
    }
    
    private func setQuestionAnswer(button : UIButton?){
        questionAnswer = button?.titleLabel?.text == "True"
    }
    
    private func paintButtonToUnselected(button: UIButton){
        selectedButton = nil
        setQuestionAnswer(button: selectedButton)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    //TODO: Create an inner property in Designable Button to know if it`s selected
    private func verifyButtonSelected(button: UIButton) -> Bool{
        return button == selectedButton
    }
    
    private func isAnyButtonSelected() -> Bool {
        return trueButtton.backgroundColor == UIColor.black || falseButton.backgroundColor == UIColor.black
    }
    
    private func verifyButtonSelectedAndOptions(button: UIButton) -> Bool{
        if isAnyButtonSelected(){
            return verifyButtonSelected(button:button)
        }
        return true
    }
    
    //TODO: Create an Resource containing all strings localizated on app.
    private func showMessage(title: String = "Error" ,message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    private func deselectButtonAndSelectOtherOption(button: UIButton){
        if let auxButton = selectedButton{
            paintButton(button: auxButton)
        }
        paintButton(button: button)
    }
    
    @IBAction func verifyAndSelect(_ sender: Any) {
        let button = sender as! UIButton
        if(verifyButtonSelectedAndOptions(button: button)){
            paintButton(button: button)
        }
        else{
            deselectButtonAndSelectOtherOption(button: button)
            //showMessage(message: "You must select only one answer")
        }
    }
    
    @IBAction func saveQuestion(_ sender: Any) {
        guard let answer = questionAnswer else {
            showMessage(message: "You forgot the answer!")
            return
        }
        guard let aux = data else{
            showMessage(message: "Can't load data!")
            return }
        guard let text = questionTextField.text else {
            showMessage(message: "You forgot the question!")
            return
        }
        if let index = questionIndex{
            aux.editQuestionAtPosition(index: index, text: text, answer: answer)
        }
        else{
            aux.addQuestion(text: text, answer: answer)
        }
        //TODO: Show sucess message
        //showMessage(title: "Alert",message: "Saved with sucess!")
        _ = navigationController?.popViewController(animated: true)
    }
}

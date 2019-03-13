//
//  TableViewController.swift
//  Quiz
//
//  Created by Rodrigo França on 03/03/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var data : SeedData!
    var indexQuestionSelected : IndexPath?
    
    class var identifier : String {
        return String(describing: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.getNumberOfQuestions()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Teste") as! CustomTableViewCell
        
        colourCell(cell: &cell, index: indexPath.row)
        cell.configureWithItem(item: data.getQuestionAtPosition(index: indexPath.row))
        
        return cell
    }
    
    private func updateDataRow(){
        
    }
    
    private func colourCell(cell : inout CustomTableViewCell, index : Int){
        if(index % 2 != 0){
            cell.answerLabel.textColor = UIColor.white
            cell.questionLabel.textColor = UIColor.white
            cell.answerHeaderLabel.textColor = UIColor.white
            cell.questionHeaderLabel.textColor = UIColor.white
            cell.backgroundColor = UIColor.black
            cell.customBorder.backgroundColor = UIColor.black
            cell.customBorder.borderColor = UIColor.white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO: Change hard coded and find ways to get identifier from segue
        if segue.identifier == "Edit" {
            if let destination = segue.destination as? QuestionViewController {
                if let position = indexQuestionSelected?.row {
                    print(position)
                    destination.questionSelected = data.getQuestionAtPosition(index: position)
                    destination.data = data
                    destination.questionIndex = position
                }
            }
        }
        else {
            if let destination = segue.destination as? QuestionViewController {
                destination.data = data
            }
        }
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexQuestionSelected = indexPath
        performSegue(withIdentifier: "Edit", sender: self)
        //tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

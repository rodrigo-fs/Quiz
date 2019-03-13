//
//  ViewController.swift
//  Quiz
//
//  Created by Rodrigo França on 27/02/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var data = SeedData.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Start"{
            if let destination = segue.destination as? QuizViewController{
                destination.data = data
            }
        }
        else{
            if let destionation = segue.destination as? TableViewController{
                destionation.data = data
            }
        }
    }

}


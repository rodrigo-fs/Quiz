//
//  TableViewCell.swift
//  TableViewTest
//
//  Created by Rodrigo França on 03/03/19.
//  Copyright © 2019 RFSEnterprises. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var customBorder: CustomView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet var questionHeaderLabel: UILabel!
    @IBOutlet var answerHeaderLabel: UILabel!
    class var identifier : String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureWithItem(item: Question){
        questionLabel.text = item.text
        answerLabel.text = String(item.answer)
    }
}

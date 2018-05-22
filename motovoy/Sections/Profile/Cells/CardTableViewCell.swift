//
//  CardTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    var deleteAction: (() -> ())? = nil
    
}

extension CardTableViewCell {
    
    @IBAction func triggerAction() {
        deleteAction?()
    }
    
}


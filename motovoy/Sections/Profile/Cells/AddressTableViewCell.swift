//
//  AddressTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/17/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    var deleteAction: (() -> ())? = nil

}

extension AddressTableViewCell {
    
    @IBAction func triggerAction() {
        deleteAction?()
    }
    
}

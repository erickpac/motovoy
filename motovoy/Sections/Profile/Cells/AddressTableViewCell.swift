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
    var data: AddressBody? = nil {
        didSet {
            if (data != nil) {
                titleLabel.text = data?.name
                detailLabel.text = data?.address
            }
        }
    }
}

extension AddressTableViewCell {
    @IBAction func triggerAction() {
        deleteAction?()
    }
}

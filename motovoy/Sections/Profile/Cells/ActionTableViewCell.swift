//
//  ActionTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/17/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ActionTableViewCell: UITableViewCell {

    var action: (() -> ())? = nil
    
    @IBAction func triggerAction() {
        action?()
    }
}

//
//  InfoTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ServiceInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var data: String? = nil {
        didSet {
            if data != nil {
                titleLabel.text = data
            }
        }
    }

}

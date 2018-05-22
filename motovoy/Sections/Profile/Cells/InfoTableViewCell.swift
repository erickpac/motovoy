//
//  InfoTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/17/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var data: (String, String)? = nil {
        didSet {
            if data != nil {
                titleLabel.text = data?.0.uppercased()
                detailLabel.text = data?.1
            }
        }
    }
    
}

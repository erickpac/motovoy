//
//  ServiceSelectionInfoTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ServiceSelectionInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var data: ServiceMVSubKit? = nil {
        didSet {
            if data != nil {
                titleLabel.text = data?.name
            }
        }
    }

}

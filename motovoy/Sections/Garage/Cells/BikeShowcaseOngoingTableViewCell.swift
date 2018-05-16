//
//  BikeShowcaseOngoingTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/15/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class BikeShowcaseOngoingTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    
    var data: BikeBody? = nil {
        didSet {
            if (data != nil) {
                titleLabel.text = data?.name
                serviceLabel.text = data?.lastItv
            }
        }
    }

}

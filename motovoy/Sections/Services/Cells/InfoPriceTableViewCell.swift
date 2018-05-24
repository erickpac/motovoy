//
//  InfoPriceTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class InfoPriceTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var data: (String, String)? = nil {
        didSet {
            if data != nil {
                titleLabel.text = data?.0
                priceLabel.text = data?.1
            }
        }
    }

}

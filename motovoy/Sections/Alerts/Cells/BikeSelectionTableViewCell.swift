//
//  BikeSelectionTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class BikeSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    var data: BikeBody! {
        didSet {
            label.text = data.name ?? "{{moto_name}}"
        }
    }

}

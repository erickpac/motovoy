//
//  InfoCheckServiceTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class InfoCheckServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var checkView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var data: (String, Bool)? = nil {
        didSet {
            checkView.isHidden = !(data?.1 ?? true)
            titleLabel.text = data?.0
        }
    }

}

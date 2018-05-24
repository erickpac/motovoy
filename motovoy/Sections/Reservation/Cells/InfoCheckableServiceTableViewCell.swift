//
//  InfoCheckableServiceTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class InfoCheckableServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var checkView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var data: (String, String, String, Bool)? = nil {
        didSet {
            checkView.isHidden = data?.3 ?? true
            titleLabel.text = data?.0
            detailLabel.text = data?.1
            priceLabel.text = data?.2
        }
    }

}

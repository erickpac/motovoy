//
//  MessageTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var data: MessageBody? = nil {
        didSet {
            if (data == nil) { return }
            configure()
        }
    }
    
    func configure() {
        dateLabel.text = data?.createdAtFormatted ?? ""
        titleLabel.text = data?.customer?.message?.split(separator: ".").last?.split(separator: "_").joined(separator: " ").capitalized
        detailLabel.text = data?.customer?.bike?.name
    }

}

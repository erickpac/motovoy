//
//  ReservationServiceTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ReservationServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var bikeLabel: UILabel!
    @IBOutlet weak var workshopLabel: UILabel!
    
    var data: ServiceBody? = nil {
        didSet {
            emptyView.isHidden = data != nil
            if data != nil {
                titleLabel.text = data?.budgetLines?.first?.reference
                detailLabel.text = data?.locator
                bikeLabel.text = data?.bike?.name
                workshopLabel.text = data?.observations
            }
        }
    }

}

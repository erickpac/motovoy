//
//  ServiceHistoryTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ServiceHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var workshopLabel: UILabel!
    
    var data: ServiceBody? = nil {
        didSet {
            emptyView.isHidden = data != nil
            if data != nil {
                titleLabel.text = "\(data?.budgetLines?.count ?? 0) Servicios"
                detailLabel.text = data?.locator
                workshopLabel.text = data?.observations
            }
        }
    }

}

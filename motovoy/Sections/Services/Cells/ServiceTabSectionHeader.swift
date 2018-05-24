//
//  ServiceTabSectionHeader.swift
//  motovoy
//
//  Created by Jose Quintero on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ServiceTabSectionHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? = nil {
        didSet {
            titleLabel.text = title
        }
    }

}

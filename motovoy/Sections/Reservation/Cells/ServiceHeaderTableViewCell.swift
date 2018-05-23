//
//  ServiceHeaderTableViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Kingfisher

class ServiceHeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var expandImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shadowedView: NavigationShadowedView!
    
    var action: (Int) -> (Bool) = { section in
        return false
    }
    var section: Int = 0
    var data: ServiceMVKit? = nil {
        didSet {
            if data != nil {
                serviceImageView.kf.setImage(with: URL.init(string: data?.iconPath ?? ""))
                titleLabel.text = data?.name
            }
        }
    }
    
    @IBAction func performAction() {
        update(with: action(section))
    }
    
    func update(with value: Bool) {
        if value {
            expandImageView.image = #imageLiteral(resourceName: "less")
//            UIView.animate(withDuration: 1, animations: {
//                self.shadowedView.alpha = 1
//            })
        }else {
            expandImageView.image = #imageLiteral(resourceName: "plusSmall")
//            UIView.animate(withDuration: 1, animations: {
//                self.shadowedView.alpha = 0
//            })
        }
    }

}

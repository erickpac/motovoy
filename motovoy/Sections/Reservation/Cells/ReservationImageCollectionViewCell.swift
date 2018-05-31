//
//  ReservationImageCollectionViewCell.swift
//  motovoy
//
//  Created by Jose Quintero on 5/28/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ReservationImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? = nil {
        didSet {
            imageView.image = image
        }
    }
}

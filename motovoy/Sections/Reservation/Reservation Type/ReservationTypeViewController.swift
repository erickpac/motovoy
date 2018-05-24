//
//  ReservationTypeViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ReservationTypeViewController: UIViewController {

    @IBOutlet var viewsCollection: [UIView]!

}

extension ReservationTypeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        viewsCollection.forEach { (view) in
            view.cornerRadiusPreset = .cornerRadius2
        }
    }
    
}

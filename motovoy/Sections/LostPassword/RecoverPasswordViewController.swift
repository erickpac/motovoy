//
//  RecoverPasswordViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material

class RecoverPasswordViewController: UIViewController {

    @IBOutlet weak var phoneField: TextField!
    @IBOutlet weak var titleBarView: UIView!

}

extension RecoverPasswordViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        titleBarView.layer.shadowColor = UIColor.black.cgColor
        titleBarView.layer.shadowOffset = CGSize(width: 0, height: 4)
        titleBarView.layer.shadowRadius = 10
        titleBarView.layer.shadowOpacity = 0.1
        
        phoneField.dividerActiveColor = UIColor.lightGray
        phoneField.textAlignment = .center
    }
    
}

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
    @IBOutlet weak var titleBarView: NavigationShadowedView!

}

extension RecoverPasswordViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        phoneField.dividerActiveColor = UIColor.lightGray
        phoneField.textAlignment = .center
    }
    
}

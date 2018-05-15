//
//  WelcomeViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/15/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var onLogin: ((UIViewController) -> ())? = nil
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? LoginViewController {
            viewController.onLogin = self.onLogin
        }
    }

}

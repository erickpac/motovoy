//
//  MainNavigationTabViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/15/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UIViewController {
    
    
    
}

class MainNavigationTabViewController: UITabBarController {

    var ready: Bool = false
    
    override func viewDidLoad() {
        for view in viewControllers ?? [] {
            guard let v = view as? BaseNavigationViewController else {
                return
            }
            v.setDelegate(self)
        }
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Utils.getLoggedUser() == nil {
            ready = false
            let registrationSb = UIStoryboard.init(name: "Registration", bundle: nil)
            let viewController = (registrationSb.instantiateInitialViewController() as! UINavigationController).topViewController as! WelcomeViewController
            viewController.onLogin = { (controller: UIViewController) in
                controller.dismiss(animated: true, completion: {
                    
                })
            }
//            present(viewController, animated: true, completion: nil)
        }else {
            super.viewDidAppear(animated)
        }
    }
    
}

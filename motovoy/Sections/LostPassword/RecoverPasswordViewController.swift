//
//  RecoverPasswordViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material
import SVProgressHUD

class RecoverPasswordViewController: UIViewController {
    @IBOutlet weak var phoneField: TextField!
    @IBOutlet weak var titleBarView: NavigationShadowedView!

    fileprivate let recoverPasswordPresenter = RecoverPasswordPresenter(apiManager: APIManager.default)
    
    @IBAction func recoverAction(_ sender: Any) {
        showLoader(show: true)
        let phone: String = phoneField.text!
        recoverPasswordPresenter.getConfirmationCode(phone: phone)
    }
}

extension RecoverPasswordViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        recoverPasswordPresenter.attachView(self)
    }
    
    func configure() {
        phoneField.dividerActiveColor = UIColor.lightGray
        phoneField.textAlignment = .center
        phoneField.text = "+34373737"
    }
}

extension RecoverPasswordViewController: RecoverPasswordView {
    func showLoader(show: Bool) {
        if show {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    func errorMessage(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    func getConfirmationCodeSuccess(phone: String) {
        
    }
}

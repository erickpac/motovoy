//
//  ChangePasswordViewController.swift
//  motovoy
//
//  Created by Erick Pac on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD
import Material

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var passwrodField: TextField!
    var phone: String?
    var smsReset: String?
    var tokenReset: String?
    fileprivate let presenter = ChangePasswordPresenter(apiManager: APIManager.default)
    
    @IBAction func changePasswordAction(_ sender: Any) {
        showLoader(show: true)
        let password: String = passwrodField.text!
        if let phone = self.phone, let smsReset = self.smsReset, let tokenReset = self.tokenReset {
            presenter.changePassword(password: password, phone: phone, smsReset: smsReset, tokenReset: tokenReset)
        }
    }
}

extension ChangePasswordViewController {
    override func viewDidLoad() {
        configure()
        presenter.attachView(self)
        if let phone = self.phone {
            presenter.resetPassword(phone: phone)
        }
    }
    
    func configure() {
        passwrodField.dividerActiveColor = UIColor.lightGray
        passwrodField.textAlignment = .center
    }
}

extension ChangePasswordViewController: ChangePasswordView {
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
    
    func resetPasswordSuccess(smsReset: String, tokenReset: String) {
        self.smsReset = smsReset
        self.tokenReset = tokenReset
    }
    
    func changePasswordSuccess() {
        
    }
}

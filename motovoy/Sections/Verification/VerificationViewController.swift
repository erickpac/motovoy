//
//  VerificationViewController.swift
//  motovoy
//
//  Created by Erick Pac on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD
import Material

class VerificationViewController: UIViewController {
    @IBOutlet weak var messageField: TextField!
    fileprivate let presenter = VerificationPresenter(apiManager: APIManager.default)
    fileprivate let mobile: String = ""
    
    @IBAction func loginAction(_ sender: Any) {
        showLoader(show: true)
        let message: String = messageField.text!
        presenter.verificationAccount(mobile: mobile, textMessage: message)
    }
    
    @IBAction func resendAction(_ sender: Any) {
        showLoader(show: true)
        let message: String = messageField.text!
        presenter.verificationAccount(mobile: mobile, textMessage: message)
    }
}

extension VerificationViewController {
    override func viewDidLoad() {
        presenter.attachView(self)
    }
}

extension VerificationViewController: VerificationView {
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
    
    func confirmationCodeSuccess() {
        
    }
    
    func verificationSuccess() {
        
    }
    
    func resetPasswordSuccess(smsReset: String, tokenReset: String) {
        
    }
}

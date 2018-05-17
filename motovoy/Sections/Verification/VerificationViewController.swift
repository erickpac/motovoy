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
    var phone: String?
    var isRecoveryPassword: Bool = false
    
    @IBAction func verifyAccountAction(_ sender: Any) {
        showLoader(show: true)
        if let phone = self.phone {
            presenter.verificationAccount(mobile: phone, textMessage:  messageField.text!, isRecoveryPassword: isRecoveryPassword)
        }
    }
}

extension VerificationViewController {
    override func viewDidLoad() {
        configure()
        presenter.attachView(self)
    }
    
    func configure() {
        messageField.dividerActiveColor = UIColor.lightGray
        messageField.textAlignment = .center
        messageField.text = "9613"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChangePasswordSegue" {
            if let vc = segue.destination as? ChangePasswordViewController {
                if let localPhone = phone {
                    vc.phone = localPhone
                }
            }
        }
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
    
    func verificationChangePasswordSuccess() {
        self.performSegue(withIdentifier: "ChangePasswordSegue", sender: nil)
    }
    
    func verificationAccountSuccess() {
        
    }
}

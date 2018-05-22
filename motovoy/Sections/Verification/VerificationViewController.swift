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
            presenter.verificationAccount(phone: phone, textMessage:  messageField.text!, isRecoveryPassword: isRecoveryPassword)
        }
    }
    
    @IBAction func getConfirmationCodeAction(_ sender: Any) {
        showLoader(show: true)
        if let phone = self.phone {
            presenter.getConfirmationCode(phone: phone)
        }
    }
}

extension VerificationViewController {
    override func viewDidLoad() {
        configure()
        presenter.attachView(self)
        if phone != nil && !isRecoveryPassword {
            presenter.getConfirmationCode(phone: phone!)
        }
    }
    
    func configure() {
        messageField.dividerActiveColor = UIColor.lightGray
        messageField.textAlignment = .center
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
        self.dismiss(animated: true, completion: nil)
    }
}

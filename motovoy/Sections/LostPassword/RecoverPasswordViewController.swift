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
    fileprivate var phone: String?

    fileprivate let recoverPasswordPresenter = RecoverPasswordPresenter(apiManager: APIManager.default)
    
    @IBAction func recoverAction(_ sender: Any) {
        showLoader(show: true)
        recoverPasswordPresenter.getConfirmationCode(phone: phoneField.text!)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecoveryPasswordSegue" {
            if let vc = segue.destination as? VerificationViewController {
                vc.phone = phoneField.text!
                vc.isRecoveryPassword = true
            }
        }
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
    
    func getConfirmationCodeSuccess() {
        self.performSegue(withIdentifier: "RecoveryPasswordSegue", sender: nil)
    }
}

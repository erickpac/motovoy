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

    fileprivate let presenter = RecoverPasswordPresenter(apiManager: APIManager.default)
    
    @IBAction func recoverAction(_ sender: Any) {
        showLoader(show: true)
        presenter.getConfirmationCode(phone: phoneField.text!)
    }
}

extension RecoverPasswordViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter.attachView(self)
    }
    
    func configure() {
        phoneField.dividerActiveColor = UIColor.lightGray
        phoneField.textAlignment = .center
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VerificationRecoveryPasswordSegue" {
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
        self.performSegue(withIdentifier: "VerificationRecoveryPasswordSegue", sender: nil)
    }
}

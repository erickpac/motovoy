//
//  LoginViewController.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material
import SVProgressHUD

class RegistrationViewController: UIViewController {
    @IBOutlet weak var titleBarView: NavigationShadowedView!
    @IBOutlet weak var nameField: TextField!
    @IBOutlet weak var emailField: TextField!
    @IBOutlet weak var phoneField: TextField!
    @IBOutlet weak var passwordField: TextField!
    @IBOutlet weak var registerButton: FlatButton!
    @IBOutlet weak var loginButton: FlatButton!
    
    fileprivate let registrationPresenter = RegistrationPresenter(apiManager: APIManager())
    
    @IBAction func registrationAction(_ sender: Any) {
        showLoader(show: true)
        let name: String = nameField.text!
        let email: String = emailField.text!
        let phone: String = phoneField.text!
        let password: String = passwordField.text!
        
        registrationPresenter.registrationProcess(name: name, email: email, phone: phone, password: password)
    }
}

extension RegistrationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        registrationPresenter.attachView(self)
    }
    
    func configure() {
        loginButton.borderColor = MColor.blue
        loginButton.borderWidthPreset = .border4
        
        nameField.dividerActiveColor = UIColor.lightGray
        emailField.dividerActiveColor = UIColor.lightGray
        phoneField.dividerActiveColor = UIColor.lightGray
        passwordField.dividerActiveColor = UIColor.lightGray
    }
}

extension RegistrationViewController: RegistrationView {
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
    
    func registrationSuccess() {
        performSegue(withIdentifier: "ShowMain", sender: nil)
    }
}

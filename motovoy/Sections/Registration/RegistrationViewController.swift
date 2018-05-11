//
//  LoginViewController.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material

class RegistrationViewController: UIViewController {
    // outlet's
    @IBOutlet weak var titleBarView: UIView!
    @IBOutlet weak var nameField: TextField!
    @IBOutlet weak var emailField: TextField!
    @IBOutlet weak var phoneField: TextField!
    @IBOutlet weak var passwordField: TextField!
    @IBOutlet weak var registerButton: FlatButton!
    @IBOutlet weak var loginButton: FlatButton!
    
    // let's
    fileprivate let registrationPresenter = RegistrationPresenter(apiManager: APIManager())
    
    // actions
    @IBAction func registrationAction(_ sender: Any) {
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
        titleBarView.layer.shadowColor = UIColor.black.cgColor
        titleBarView.layer.shadowOffset = CGSize(width: 0, height: 4)
        titleBarView.layer.shadowRadius = 10
        titleBarView.layer.shadowOpacity = 0.1
        
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
        
    }
    
    func errorMessage(message: String) {
        
    }
    
    func registrationSuccess() {
        
    }
}

//
//  LoginViewController.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material

class LoginViewController: UIViewController {
    // outlet's
    @IBOutlet weak var titleBarView: UIView!
    @IBOutlet weak var userField: TextField!
    @IBOutlet weak var passwordField: TextField!
    @IBOutlet weak var registerButton: FlatButton!
    @IBOutlet weak var loginButton: FlatButton!
    
    // var's
    fileprivate let loginPresenter = LoginPresenter(apiManager: APIManager())
    
    // actions
    @IBAction func loginAction(_ sender: Any) {
        let emailPhone: String = userField.text!
        let password: String = passwordField.text!
        loginPresenter.loginProcess(emailPhone: emailPhone, password: password)
    }
}

extension LoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        loginPresenter.attachView(self)
    }
    
    func configure() {
        titleBarView.layer.shadowColor = UIColor.black.cgColor
        titleBarView.layer.shadowOffset = CGSize(width: 0, height: 4)
        titleBarView.layer.shadowRadius = 10
        titleBarView.layer.shadowOpacity = 0.1
        
        registerButton.borderColor = MColor.blue
        registerButton.borderWidthPreset = .border4
        
        userField.dividerActiveColor = UIColor.lightGray
        passwordField.dividerActiveColor = UIColor.lightGray
        userField.text = "+34373737"
        passwordField.text = "prueba"
    }
}

extension LoginViewController: LoginView {
    func showLoader(show: Bool) {
        
    }
    
    func errorMessage(message: String) {
        
    }
    
    func loginSuccess(user: User) {
        loginButton.title = user.name
    }
}

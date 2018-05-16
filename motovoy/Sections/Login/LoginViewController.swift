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

class LoginViewController: UIViewController {
    @IBOutlet weak var titleBarView: NavigationShadowedView!
    @IBOutlet weak var userField: TextField!
    @IBOutlet weak var passwordField: TextField!
    @IBOutlet weak var registerButton: FlatButton!
    @IBOutlet weak var loginButton: FlatButton!
    
    fileprivate let loginPresenter = LoginPresenter(apiManager: APIManager.default)
    
    var onLogin: ((UIViewController) -> ())? = nil
    
    @IBAction func loginAction(_ sender: Any) {
        showLoader(show: true)
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
        if show {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    func errorMessage(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    func loginSuccess() {
        Utils.currentUser = nil
        
        if (onLogin != nil) {
            onLogin?(self)
            return
        }
        
        performSegue(withIdentifier: "ShowMain", sender: nil)
    }
}

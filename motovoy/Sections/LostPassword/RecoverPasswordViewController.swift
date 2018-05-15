//
//  RecoverPasswordViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material
import APESuperHUD

class RecoverPasswordViewController: UIViewController {
    @IBOutlet weak var phoneField: TextField!
    @IBOutlet weak var titleBarView: NavigationShadowedView!

    fileprivate let recoverPasswordPresenter = RecoverPasswordPresenter(apiManager: APIManager())
    
    @IBAction func recoverAction(_ sender: Any) {
        showLoader(show: true)
        let phone: String = phoneField.text!
        recoverPasswordPresenter.recoverPasswordProcess(phone: phone)
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
}

extension RecoverPasswordViewController: RecoverPasswordView {
    func showLoader(show: Bool) {
        if show {
            APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: "Cargando...", presentingView: self.view)
        } else {
            APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
        }
    }
    
    func errorMessage(message: String) {
        APESuperHUD.showOrUpdateHUD(icon: .sadFace, message: message, duration: 3.0, presentingView: self.view, completion: nil)
    }
    
    func recoverySuccess() {
        
    }
}

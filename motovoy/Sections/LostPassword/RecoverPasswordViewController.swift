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
    // outlet's
    @IBOutlet weak var phoneField: TextField!
    @IBOutlet weak var titleBarView: UIView!

    // let's
    fileprivate let recoverPasswordPresenter = RecoverPasswordPresenter(apiManager: APIManager())
    
    // actions
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
        titleBarView.layer.shadowColor = UIColor.black.cgColor
        titleBarView.layer.shadowOffset = CGSize(width: 0, height: 4)
        titleBarView.layer.shadowRadius = 10
        titleBarView.layer.shadowOpacity = 0.1
        
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

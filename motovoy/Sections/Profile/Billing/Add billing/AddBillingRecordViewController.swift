//
//  AddBillingRecordViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material
import SVProgressHUD

class AddBillingRecordViewController: UIViewController {
    @IBOutlet weak var titleBarView: NavigationShadowedView!
    @IBOutlet weak var nameField: TextField!
    @IBOutlet weak var lastNameField: TextField!
    @IBOutlet weak var nifField: TextField!
    @IBOutlet weak var phoneField: TextField!
    @IBOutlet weak var emailField: TextField!
    fileprivate let presenter = AddBillingPresenter(apiManager: APIManager.default)
    var user: User? {
        get {
            return Utils.currentUser
        }
    }
    
    @IBAction func editAction(_ sender: Any) {
        showLoader(show: true)
        let name: String = nameField.text!
        let lastname: String = lastNameField.text!
        let nif: String = nifField.text!
        let phone: String = phoneField.text!
        let email: String = emailField.text!
        
        presenter.editProfile(name: name, lastName: lastname, nif: nif, phone: phone, email: email)
    }
}

extension AddBillingRecordViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter.attachView(self)
    }
    
    func configure() {
        nameField.dividerActiveColor = UIColor.lightGray
        lastNameField.dividerActiveColor = UIColor.lightGray
        nifField.dividerActiveColor = UIColor.lightGray
        phoneField.dividerActiveColor = UIColor.lightGray
        emailField.dividerActiveColor = UIColor.lightGray
        
        nameField.text = user?.name ?? ""
        lastNameField.text = user?.detail?.surName ?? ""
        nifField.text = user?.nif ?? ""
        phoneField.text = user?.mobile ?? ""
        emailField.text = user?.email ?? ""
    }
}

extension AddBillingRecordViewController: AddBillingView {
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
    
    func editProfileSuccess(user: User) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}

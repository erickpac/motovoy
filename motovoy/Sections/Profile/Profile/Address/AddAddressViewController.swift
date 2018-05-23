//
//  AddAddressViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material
import SVProgressHUD

class AddAddressViewController: UIViewController {
    @IBOutlet weak var titleBarView: NavigationShadowedView!
    @IBOutlet weak var nameField: TextField!
    @IBOutlet weak var streetField: TextField!
    @IBOutlet weak var streetNumberField: TextField!
    @IBOutlet weak var postalCodeField: TextField!
    @IBOutlet weak var provinceField: TextField!
    
    fileprivate let presenter = AddressPresenter(apiManager: APIManager.default)
    
    @IBAction func createAction(_ sender: Any) {
        showLoader(show: true)
        let name: String = nameField.text!
        let street: String = streetField.text!
        let streetNumber: String = streetNumberField.text!
        let postalCode: String = postalCodeField.text!
        let province: String = provinceField.text!
        
        presenter.addAddress(address: street, streetNumber: streetNumber, city: province, postalCode: postalCode, name: name)
    }
}

extension AddAddressViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter.attachView(self)
    }
    
    func configure() {
        nameField.dividerActiveColor = UIColor.lightGray
        streetNumberField.dividerActiveColor = UIColor.lightGray
        streetField.dividerActiveColor = UIColor.lightGray
        postalCodeField.dividerActiveColor = UIColor.lightGray
        provinceField.dividerActiveColor = UIColor.lightGray
    }
}

extension AddAddressViewController: AddressView {
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
    
    func addAddressSuccess() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}

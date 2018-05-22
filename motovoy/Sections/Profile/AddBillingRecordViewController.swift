//
//  AddBillingRecordViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material

class AddBillingRecordViewController: UIViewController {
    @IBOutlet weak var titleBarView: NavigationShadowedView!
    @IBOutlet weak var nameField: TextField!
    @IBOutlet weak var lastNameField: TextField!
    @IBOutlet weak var nifField: TextField!
    @IBOutlet weak var phoneField: TextField!
    @IBOutlet weak var emailField: TextField!
    
    fileprivate let addressPresenter = BikePresenter(apiManager: APIManager())
    
    @IBAction func createAction(_ sender: Any) {
        let name: String = nameField.text!
        let lastname: String = lastNameField.text!
        let nif: String = nifField.text!
        let phone: String = phoneField.text!
        let email: String = emailField.text!
    }
}

extension AddBillingRecordViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addressPresenter.attachView(self)
    }
    
    func configure() {
        nameField.dividerActiveColor = UIColor.lightGray
        lastNameField.dividerActiveColor = UIColor.lightGray
        nifField.dividerActiveColor = UIColor.lightGray
        phoneField.dividerActiveColor = UIColor.lightGray
        emailField.dividerActiveColor = UIColor.lightGray
    }
}

extension AddBillingRecordViewController: BikeView {
    func showLoader(show: Bool) {
        
    }
    
    func errorMessage(message: String) {
        
    }
    
    func getBikeResourcesSuccess(brandResources: BrandResources) {
        
    }
}

//
//  AddAddressViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material

class AddAddressViewController: UIViewController {
    @IBOutlet weak var titleBarView: NavigationShadowedView!
    @IBOutlet weak var nameField: TextField!
    @IBOutlet weak var streetField: TextField!
    @IBOutlet weak var streetNumberField: TextField!
    @IBOutlet weak var postalCodeField: TextField!
    @IBOutlet weak var provinceField: TextField!
    
    fileprivate let addressPresenter = BikePresenter(apiManager: APIManager())
    
    @IBAction func createAction(_ sender: Any) {
        let name: String = nameField.text!
        let street: String = streetField.text!
        let streetNumber: Int = Int(streetNumberField.text!) ?? 0
        let postalCode: Int = Int(postalCodeField.text!) ?? 0
        let province: String = provinceField.text!
    }
}

extension AddAddressViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addressPresenter.attachView(self)
    }
    
    func configure() {
        nameField.dividerActiveColor = UIColor.lightGray
        streetNumberField.dividerActiveColor = UIColor.lightGray
        streetField.dividerActiveColor = UIColor.lightGray
        postalCodeField.dividerActiveColor = UIColor.lightGray
        provinceField.dividerActiveColor = UIColor.lightGray
    }
}

extension AddAddressViewController: BikeView {
    func showLoader(show: Bool) {
        
    }
    
    func errorMessage(message: String) {
        
    }
    
    func getBikeResourcesSuccess(brandResources: BrandResources) {
        
    }
}

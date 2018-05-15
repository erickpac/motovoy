//
//  BikeCreationViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material

class BikeCreationViewController: UIViewController {
    @IBOutlet weak var titleBarView: NavigationShadowedView!
    @IBOutlet weak var nameField: TextField!
    @IBOutlet weak var brandField: TextField!
    @IBOutlet weak var modelField: TextField!
    @IBOutlet weak var cilinderField: TextField!
    @IBOutlet weak var yearField: TextField!
    @IBOutlet weak var plateField: TextField!
    @IBOutlet weak var createButton: FlatButton!
    
    fileprivate let bikePresenter = BikePresenter(apiManager: APIManager())
    
    @IBAction func createAction(_ sender: Any) {
        let name: String = nameField.text!
        let brandId: String = brandField.text!
        let model: Int = Int(modelField.text!) ?? 0
        let cylinderCapacity: Int = Int(cilinderField.text!) ?? 0
        let year: Int = Int(yearField.text!) ?? 0
        let registrationNumber: String = plateField.text!
        
        bikePresenter.newBike(name: name, brandId: brandId, model: model, cylinderCapacity: cylinderCapacity, year: year, registrationNumber: registrationNumber)
    }
}

extension BikeCreationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bikePresenter.attachView(self)
    }
    
    func configure() {
        nameField.dividerActiveColor = UIColor.lightGray
        brandField.dividerActiveColor = UIColor.lightGray
        modelField.dividerActiveColor = UIColor.lightGray
        cilinderField.dividerActiveColor = UIColor.lightGray
        yearField.dividerActiveColor = UIColor.lightGray
        plateField.dividerActiveColor = UIColor.lightGray
        brandField.inputView = UIView()
        modelField.inputView = UIView()
        cilinderField.inputView = UIView()
        yearField.inputView = UIView()
    }
}

extension BikeCreationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let presentPicker: () -> () =  {
            self.performSegue(withIdentifier: "OptionSelectionSegue", sender: textField)
        }
        
        switch textField {
        case brandField: presentPicker()
        case modelField: presentPicker()
        case cilinderField: presentPicker()
        case yearField: presentPicker()
        default: break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OptionSelectionSegue" {
            let viewController = segue.destination as! OptionSelectionAlertViewController
            switch (sender as! TextField) {
            case brandField:
                viewController.modalTitle = "MARCA"
                break;
            case modelField:
                viewController.modalTitle = "MODELO"
                break;
            case cilinderField:
                viewController.modalTitle = "CILINDRAJE"
                break;
            case yearField:
                viewController.modalTitle = "AñO".uppercased()
                break;
            default: break;
            }
        }
    }
}

extension BikeCreationViewController: BikeView {
    func showLoader(show: Bool) {
        
    }
    
    func errorMessage(message: String) {
        
    }
    
    func getBikeResourcesSuccess(brandResources: BrandResources) {
        
    }
}

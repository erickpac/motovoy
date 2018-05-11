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
    
    // let's
    fileprivate let registrationPresenter = RegistrationPresenter(apiManager: APIManager())
    
    // actions
    @IBAction func createAction(_ sender: Any) {
        
    }

}

extension BikeCreationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        nameField.dividerActiveColor = UIColor.lightGray
        brandField.dividerActiveColor = UIColor.lightGray
        modelField.dividerActiveColor = UIColor.lightGray
        cilinderField.dividerActiveColor = UIColor.lightGray
        yearField.dividerActiveColor = UIColor.lightGray
        plateField.dividerActiveColor = UIColor.lightGray
        
        brandField.delegate = self
        modelField.delegate = self
        cilinderField.delegate = self
        yearField.delegate = self
    }
    
}

extension BikeCreationViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let presentPicker: () -> Bool =  {
            self.performSegue(withIdentifier: "OptionSelectionSegue", sender: textField);
            return false;
        }
        
        switch textField {
        case brandField: return presentPicker()
        case modelField: return presentPicker()
        case cilinderField: return presentPicker()
        case yearField: return presentPicker()
        default: return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OptionSelectionSegue" {
            let viewController = segue.destination as! OptionSelectionAlertViewController
            switch (sender as! TextField) {
            case brandField: return viewController.modalTitle = "MARCA"
            case modelField: return viewController.modalTitle = "MODELO"
            case cilinderField: return viewController.modalTitle = "CILINDRAJE"
            case yearField: return viewController.modalTitle = "AñO".uppercased()
            default: break;
            }
        }
    }
    
}

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

//
//  BikeCreationViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material
import SVProgressHUD

class BikeCreationViewController: UIViewController {
    @IBOutlet weak var titleBarView: NavigationShadowedView!
    @IBOutlet weak var nameField: TextField!
    @IBOutlet weak var brandField: TextField!
    @IBOutlet weak var modelField: TextField!
    @IBOutlet weak var cilinderField: TextField!
    @IBOutlet weak var yearField: TextField!
    @IBOutlet weak var plateField: TextField!
    @IBOutlet weak var createButton: FlatButton!
    
    fileprivate let presenter = BikePresenter(apiManager: APIManager())
    
    var brands: BrandResources? = nil
    var brand: Brand? = nil
    var model: BrandModel? = nil
    var vehicle: BrandVehicle? = nil
    
    @IBAction func createAction(_ sender: Any) {
        let name: String = nameField.text!
        let brandId: String = (brand?.id ?? 0).description
        let model: Int = (self.model?.id ?? 0)
        let cylinderCapacity: Int = (vehicle?.cc ?? 0)
        let year: Int = (vehicle?.generalYearStart ?? 0)
        let registrationNumber: String = plateField.text!
        
        presenter.newBike(name: name, brandId: brandId, model: model, cylinderCapacity: cylinderCapacity, year: year, registrationNumber: registrationNumber)
    }
}

extension BikeCreationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter.attachView(self)
        presenter.getBrands()
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
        yearField.delegate = self
        brandField.delegate = self
        modelField.delegate = self
        cilinderField.delegate = self
        yearField.delegate = self
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
            viewController.buttonTitle = "CANCELAR"
            switch (sender as! TextField) {
            case brandField:
                viewController.modalTitle = "MARCA"
                viewController.data = brands?.brands?.map({ (brand) -> String in
                    return brand.name ?? ""
                }) ?? []
                viewController.delegate = { index in
                    self.brand = self.brands?.brands?.filter({ (brand) -> Bool in
                        return brand.name == viewController.data[index]
                    }).first
                    self.brandField.text = self.brand?.name
                    viewController.dismissView()
                }
                break;
            case modelField:
                viewController.modalTitle = "MODELO"
                viewController.data = brand?.models?.map({$0.name ?? ""}) ?? []
                viewController.delegate = { index in
                    self.model = self.brand?.models?.filter({$0.name == viewController.data[index]}).first
                    self.modelField.text = self.model?.name
                    viewController.dismissView()
                }
                break;
            case cilinderField:
                viewController.modalTitle = "CILINDRAJE"
                viewController.data = model?.vehicles?.map({($0.cc ?? 0).description}) ?? []
                viewController.delegate = { index in
                    self.vehicle = self.model?.vehicles?.filter({($0.cc?.description ?? "") == viewController.data[index]}).first
                    self.cilinderField.text = self.vehicle?.cc?.description
                    self.yearField.text = self.vehicle?.generalYearStart?.description
                    viewController.dismissView()
                }
                break;
            case yearField:
                viewController.modalTitle = "AñO".uppercased()
                viewController.data = model?.vehicles?.map({($0.generalYearStart ?? 0).description}) ?? []
                viewController.delegate = { index in
                    self.vehicle = self.model?.vehicles?.filter({($0.generalYearStart?.description ?? "") == viewController.data[index]}).first
                    self.yearField.text = self.vehicle?.generalYearStart?.description
                    self.cilinderField.text = self.vehicle?.cc?.description
                    viewController.dismissView()
                }
                break;
            default: break;
            }
        }
    }
}

extension BikeCreationViewController: BikeView {
    func showLoader(show: Bool) {
        if show {
            SVProgressHUD.show()
        }else {
            SVProgressHUD.dismiss()
        }
    }
    
    func errorMessage(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    func getBikeResourcesSuccess(brandResources: BrandResources) {
        self.brands = brandResources
    }
}

extension BikeCreationViewController {
    @IBAction func editBrands() {
        performSegue(withIdentifier: "OptionSelectionSegue", sender: brandField)
    }
    
    @IBAction func editModel() {
        performSegue(withIdentifier: "OptionSelectionSegue", sender: modelField)
    }
    
    @IBAction func editCilinders() {
        performSegue(withIdentifier: "OptionSelectionSegue", sender: cilinderField)
    }
    
    @IBAction func editYear() {
        performSegue(withIdentifier: "OptionSelectionSegue", sender: yearField)
    }
}

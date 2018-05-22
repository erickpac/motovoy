//
//  MainGarageViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol BikeSelectionDelegate {
    func didSelect(bike: BikeBody)
    func createBike()
}

class MainGarageViewController: BaseNavigationViewController {
    @IBOutlet weak var mainLabel: ActiveLabel!
    var currentBike: BikeBody? = nil
    var bikes: [BikeBody] = []
    var currentServices: [String] = ["servicio"]
    
    var bikesPresenter: GaragePresenter = GaragePresenter(apiManager: APIManager.default)
}

extension MainGarageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        bikesPresenter.attachView(self)
        bikesPresenter.getBikes()
        configure()
    }
    
    func configureLabel() {
        let bikeType = ActiveType.custom(pattern: "\\s\(currentBike?.name ?? "moto")\\b")
        var services: [ActiveType] = [bikeType]
        for service in currentServices {
            services.append(
                ActiveType.custom(pattern: "\\s\(service)\\b")
            )
        }
        
        mainLabel.enabledTypes = services
        
        for service in mainLabel.enabledTypes {
            mainLabel.customColor[service] = MColor.orange
            mainLabel.customSelectedColor[service] = MColor.orange.withAlphaComponent(0.3)
            mainLabel.customBackgroundColor[service] = UIColor.gray.withAlphaComponent(0.3)
            
            mainLabel.handleCustomTap(for: service) { element in
                if element == (self.currentBike?.name ?? "moto") {
                    self.selectBike()
                }else {
                    if let index = self.currentServices.index(of: element) {
                        if element == "servicio" {
                            self.selectService()
                        }else {
                            self.currentServices.remove(at: index)
                        }
                    }else {
                        self.selectService()
                    }
                }
            }
        }
        
        var title = "Mi \(currentBike?.name ?? "moto") necesita"
        for service in currentServices {
            title = title + " \(service)"
        }
        title = title + " en Barcelona."
    

        mainLabel.text = title
    }
    
    func configure() {
        configureLabel()
    }
    
}

extension MainGarageViewController: GarageView {
    
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
    
    func getBikeSuccess(bikes: [BikeBody]) {
        self.bikes = bikes
    }
    
    func getHistorySuccess() {
        
    }
    
    func updateBikeSuccess() {
        
    }
    
    func deleteBikeSuccess() {
        
    }
    
}

extension MainGarageViewController: BikeSelectionDelegate {
    
    func didSelect(bike: BikeBody) {
        self.currentBike = bike
        self.configureLabel()
    }
    
    func createBike() {
        dismiss(animated: true) {
            self.performSegue(withIdentifier: "BikeCreationSegue", sender: nil)
        }
    }
    
}

extension MainGarageViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BikeSelectionSegue" {
            let bikeSelectionController = segue.destination as! BikeSelectionViewController
            bikeSelectionController.data = self.bikes
            bikeSelectionController.delegate = self
        }else if segue.identifier == "ServiceSelectionSegue" {
            let serviceSelectionController = segue.destination as! ServicesMVViewController
            serviceSelectionController.motoId = currentBike?.id?.description ?? ""
        }
    }
    
}

extension MainGarageViewController {
    
    func selectBike() {
        performSegue(withIdentifier: "BikeSelectionSegue", sender: nil)
    }
    
    func selectService() {
        if currentBike == nil {
            return
        }
        performSegue(withIdentifier: "ServiceSelectionSegue", sender: nil)
    }
    
}

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
    var currentKits: [String: ServiceMVSubKit] = [:]
    
    var bikesPresenter: GaragePresenter = GaragePresenter(apiManager: APIManager.default)
}

extension MainGarageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        bikesPresenter.attachView(self)
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bikesPresenter.getBikes()
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
                        if element == "servicio" || element == "agregar servicio" {
                            self.selectService()
                        }else {
                            self.currentServices.remove(at: index)
                            self.currentKits.removeValue(forKey: element)
                        }
                    }else {
                        self.selectService()
                    }
                }
            }
        }
        
        var title = "Mi \(currentBike?.name ?? "moto") necesita" + "\n"
        for service in currentServices {
            let colon: String = {
                var c = ""
                c.append(currentServices.index(of: service) == (currentServices.count - 1) ? "" : ",")
                return c
            }()
            title = title + "\(service)\(colon)" + "\n"
        }
        title = title + "en Barcelona."
    

        mainLabel.text = title
    }
    
    func configure() {
        configureLabel()
    }
    
}

extension MainGarageViewController: GarageView {
    
    func showLoader(show: Bool) {
        if show {
            if bikes.count != 0 {
                return
            }
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
            serviceSelectionController.delegate = self
            serviceSelectionController.disabledKits = self.currentKits.map({return $0.value})
        }else if segue.identifier == "" {
            let viewController = segue.destination as! ReservationTypeViewController
            viewController.kits = self.currentKits
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

extension MainGarageViewController: ServicesSelectionInfoDelegate {
    func didSelect(service: String, value: ServiceMVSubKit) {
        if self.currentServices.index(of: "servicio") != nil {
            self.currentServices = []
            self.currentServices.append(service.lowercased())
            self.currentKits[service.lowercased()] = value
            if let idx = self.currentServices.index(of: "agregar servicio") {
                self.currentServices.remove(at: idx)
            }else if let idx = self.currentServices.index(of: "servicio") {
                self.currentServices.remove(at: idx)
            }
            self.currentServices.append("agregar servicio")
        }else if self.currentServices.index(of: "agregar servicio") != nil {
            var contents = self.currentServices
            if let idx = contents.index(of: "agregar servicio") {
                contents.remove(at: idx)
            }else if let idx = contents.index(of: "servicio") {
                contents.remove(at: idx)
            }
            contents.append(contentsOf: [service.lowercased(), "agregar servicio"])
            self.currentKits[service.lowercased()] = value
            self.currentServices = contents
        }
        
        configureLabel()
    }
}

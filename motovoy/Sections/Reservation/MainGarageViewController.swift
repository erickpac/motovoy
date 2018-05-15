//
//  MainGarageViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

protocol BikeSelectionDelegate {
    func didSelect(bike: Bike)
    func createBike()
}

class MainGarageViewController: BaseNavigationViewController {
    @IBOutlet weak var mainLabel: ActiveLabel!
    var currentBike: Bike? = nil
    var currentServices: [String] = ["servicio"]
}

extension MainGarageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
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
                        self.currentServices.remove(at: index)
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

extension MainGarageViewController: BikeSelectionDelegate {
    
    func didSelect(bike: Bike) {
        self.currentBike = bike
    }
    
    func createBike() {
        performSegue(withIdentifier: "BikeCreationSegue", sender: nil)
    }
    
}

extension MainGarageViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BikeSelectionSegue" {
            let bikeSelectionController = segue.destination as! BikeSelectionViewController
            bikeSelectionController.delegate = self
        }
    }
    
}

extension MainGarageViewController {
    
    func selectBike() {
        performSegue(withIdentifier: "BikeSelectionSegue", sender: nil)
    }
    
    func selectService() {
        
    }
    
}

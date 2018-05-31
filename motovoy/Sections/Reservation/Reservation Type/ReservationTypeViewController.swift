//
//  ReservationTypeViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

class ReservationTypeViewController: UIViewController {
    @IBOutlet var viewsCollection: [UIView]!
    var bike: BikeBody!
    var garage: GarageBody? {
        didSet {
            viewsCollection.forEach { (view) in
                if let titleLabel = view.viewWithTag(-1) as? UILabel {
                    titleLabel.text = garage?.name ?? "Sin disponibilidad"
                }
                UIView.animate(withDuration: 0.3, animations: {
                    view.alpha = 1
                })
            }
        }
    }
    var kits: [String: ServiceMVSubKit] = [:]
    fileprivate let presenter = ReservationTypePresenter(apiManager: APIManager.default)
}

extension ReservationTypeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getGarages()
    }
    
    func configure(){
        viewsCollection.forEach { (view) in
            view.alpha = 0.3
            view.cornerRadiusPreset = .cornerRadius2
        }
    }
}

extension ReservationTypeViewController {
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "TakeItSegue" {
            return garage != nil
        }else {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ReservationDetailViewController
        viewController.bikeId = bike.id ?? 0
        viewController.isPickup = segue.identifier != "TakeItSegue"
        if let g = garage {
            viewController.workshop = g
        }
        viewController.kits = kits
    }
    
}

extension ReservationTypeViewController: ReservationTypeView {
    func showLoader(show: Bool) {
        show ? SVProgressHUD.show() : SVProgressHUD.dismiss()
    }
    
    func errorMessage(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    func getGaragesSuccess(garages: [GarageBody]) {
        if garages.count == 0 {
            SVProgressHUD.showError(withStatus: "No hay servicio disponible en este momento")
            self.navigationController?.popViewController(animated: true)
        }else {
            self.garage = garages.first
        }
    }
}

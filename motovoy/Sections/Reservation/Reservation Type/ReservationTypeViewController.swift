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
    var garage: GarageBody? {
        didSet {
            viewsCollection.forEach { (view) in
                if let titleLabel = view.viewWithTag(-1) as? UILabel {
                    titleLabel.text = garage?.name ?? "Sin disponibilidad"
                }
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
    
    func configure(){
        viewsCollection.forEach { (view) in
            view.cornerRadiusPreset = .cornerRadius2
        }
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
        self.garage = garages.first
    }
}

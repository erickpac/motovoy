//
//  ReservationTypeViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ReservationTypeViewController: UIViewController {
    @IBOutlet var viewsCollection: [UIView]!
    var garages: [GarageBody]?
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
        
    }
    
    func errorMessage(message: String) {
        
    }
    
    func getGaragesSuccess(garages: [GarageBody]) {
        self.garages = garages
    }
}

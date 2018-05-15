//
//  GarageViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/15/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import APESuperHUD

class GarageViewController: UIViewController {
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var tableView: UITableView!
    fileprivate let presenter = GaragePresenter(apiManager: APIManager.default)
    
    var bikes: [BikeBody] = [BikeBody]() {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.reloadData()
        }
    }
}

extension GarageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        presenter.getBikes()
    }
}

extension GarageViewController: GarageView {
    func showLoader(show: Bool) {
        if show {
            APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: "Cargando...", presentingView: self.view)
        } else {
            APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
        }
    }
    
    func errorMessage(message: String) {
        APESuperHUD.showOrUpdateHUD(icon: .sadFace, message: message, duration: 3.0, presentingView: self.view, completion: nil)
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

extension GarageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bikes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = bikes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BikeShowcaseLastService")
        return cell!
    }
}

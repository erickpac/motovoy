//
//  GarageViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/15/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

class GarageViewController: BaseNavigationViewController {
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var tableView: UITableView!
    fileprivate let presenter = GaragePresenter(apiManager: APIManager.default)
    
    var bikes: [BikeBody] = [BikeBody]() {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 300
            tableView.reloadData()
        }
    }
}

extension GarageViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attachView(self)
        presenter.getBikes()
    }
}

extension GarageViewController: GarageView {
    func showLoader(show: Bool) {
        if show {
            if (bikes.count != 0) {
                return;
            }
            SVProgressHUD.show()
        } else {
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

extension GarageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bikes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = bikes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BikeShowcaseLastService") as? BikeShowcaseLastServiceTableViewCell
        cell?.data = data
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

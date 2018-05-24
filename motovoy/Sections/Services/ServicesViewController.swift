//
//  ServicesViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/15/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

class ServicesViewController: BaseNavigationViewController {
    @IBOutlet weak var tableView: UITableView!
    fileprivate let presenter = ServicesPresenter(apiManager: APIManager.default)
    var services: [ServiceBody] = [ServiceBody]() {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 300
            tableView.reloadData()
        }
    }
}

extension ServicesViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attachView(self)
        presenter.getBudgets()
    }
}

extension ServicesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = services[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BikeShowcaseLastService") as? BikeShowcaseLastServiceTableViewCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension ServicesViewController: ServicesView {
    func showLoader(show: Bool) {
        if show {
            if (services.count != 0) {
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
    
    func getServicesSuccess(services: [ServiceBody]) {
        self.services = services
    }
}

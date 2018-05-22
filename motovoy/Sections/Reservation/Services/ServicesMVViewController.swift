//
//  ServicesMVViewController.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

class ServicesMVViewController: BaseNavigationViewController {
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var tableView: UITableView!
    fileprivate let presenter = ServicesMVPresenter(apiManager: APIManager.default)
    var motoId: String?
    
    var services: [ServiceMVKit] = [ServiceMVKit]() {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 300
            tableView.reloadData()
        }
    }
}

extension ServicesMVViewController {
    override func viewDidLoad() {
        presenter.attachView(self)
        if let motoId = motoId {
            presenter.getServices(motoId: motoId)
        }
    }
}

extension ServicesMVViewController: ServicesMVView {
    func showLoader(show: Bool) {
        if show {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    func errorMessage(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    func getServicesSuccess(services: [ServiceMVKit]) {
        self.services = services
    }
}

extension ServicesMVViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BikeShowcaseLastService") as? BikeShowcaseLastServiceTableViewCell
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

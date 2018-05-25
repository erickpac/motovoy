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
    var disabledKits: [ServiceMVSubKit] = []
    var motoId: String?
    var activeSections: [Bool] = []
    var services: [ServiceMVKit] = [ServiceMVKit]() {
        didSet {
            activeSections = services.map { service in return false }
            tableView.register(UINib.init(nibName: "ServiceSectionHeaderView", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "ServiceHeaderCell")
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 300
            tableView.reloadData()
        }
    }
    var delegate: ServicesSelectionInfoDelegate? = nil
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
        return services.count
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeSections[section] ? services[section].subKits?.count ?? 0 : 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ServiceHeaderCell") as! ServiceHeaderTableViewCell
        cell.section = section
        cell.data = services[section]
        cell.action = { section in
            if self.services[section].id == 2 {
                self.performSegue(withIdentifier: "ServiceSegue", sender: nil)
                return self.activeSections[section]
            }
            self.activeSections[section] = !self.activeSections[section]
            tableView.reloadSections([section], with: UITableViewRowAnimation.automatic)
            return self.activeSections[section]
        }
        cell.update(with: self.activeSections[section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceInfoCell") as? ServiceSelectionInfoTableViewCell
        cell?.data = services[indexPath.section].subKits?[indexPath.row]
        if disabledKits.contains(where: { (kit) -> Bool in
            return kit.id == cell?.data?.id
        }) {
            cell?.titleLabel.alpha = 0.3
        }else {
            cell?.titleLabel.alpha = 1
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let value = services[indexPath.section].subKits?[indexPath.row] {
            if disabledKits.contains(where: { (kit) -> Bool in
                return kit.id == value.id
            }){
                SVProgressHUD.showError(withStatus: "Servicio ya seleccionado previamente.")
            }else {
                delegate?.didSelect(service: value.name ?? "", value: value)
                navigationController?.popToRootViewController(animated: true)
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 76
    }
}

extension ServicesMVViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ServiceSegue" {
            let viewController = segue.destination as! ServicesSelectionInfoViewController
            viewController.delegate = self.delegate
        }
    }
    
}

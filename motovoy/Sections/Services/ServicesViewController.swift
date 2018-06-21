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
            tableView.backgroundView?.backgroundColor = .white
            tableView.backgroundColor = .white
            tableView.reloadData()
        }
    }
}

extension ServicesViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attachView(self)
        presenter.getBudgets()
        tableView.register(UINib.init(nibName: "ServiceTabSectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
    
    func reloadBugets() {
        presenter.getBudgets()
    }
}

extension ServicesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let reservationCount = services.filter({ service in return service.status == "pending_approval"}).count
        let approvedCount = services.filter({ service in return service.status == "approved" || service.status == "in_progress"}).count
        let closedCount = services.filter({ service in return service.status == "closed"}).count
        let historyCount = services.filter({ service in return (service.status != "pending_approval" || service.status != "in_progress" || service.status != "closed" || service.status != "approved")}).count
        return [
            reservationCount == 0 ? 1 : reservationCount,
            approvedCount == 0 ? 1 : approvedCount,
            closedCount == 0 ? 1 : closedCount,
            historyCount == 0 ? 1 : historyCount
        ][section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let d = [
            services.filter({ service in return service.status == "pending_approval"}),
            services.filter({ service in return service.status == "approved" || service.status == "in_progress"}),
            services.filter({ service in return service.status == "closed"}),
            services.filter({ service in return (service.status != "pending_approval" || service.status != "in_progress" || service.status != "closed" || service.status != "approved")})
        ][indexPath.section]
        var data: ServiceBody? = nil
        if d.count != 0 {
            data = d[indexPath.row]
        }
        
        var cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            if let c = tableView.dequeueReusableCell(withIdentifier: "ReservedService") as? ReservationServiceTableViewCell {
                c.data = data
                cell = c
            }
        case 1:
            if let c = tableView.dequeueReusableCell(withIdentifier: "OngoingService") as? OngoingDiagnosticTableViewCell {
                c.data = data
                cell = c
            }
        case 2:
            if let c = tableView.dequeueReusableCell(withIdentifier: "OngoingService") as? OngoingDiagnosticTableViewCell {
                c.data = data
                cell = c
            }
        case 3:
            if let c = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as? ServiceHistoryTableViewCell {
                c.data = data
                cell = c
            }
        default:
            return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? ServiceTabSectionHeader
        view?.title = [
            "RESERVA",
            "SERVICIO EN CURSO",
            "SERVICIO FINALIZADO",
            "HISTORIAL DE SERVICIOS"
        ][section]
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let d = [
            services.filter({ service in return service.status == "pending_approval"}),
            services.filter({ service in return service.status == "approved" || service.status == "in_progress"}),
            services.filter({ service in return service.status == "closed"}),
            services.filter({ service in return (service.status != "pending_approval" || service.status != "in_progress" || service.status != "closed" || service.status != "approved")})
        ]
        
        let data = d[indexPath.section]
        let hasData = data.count > 0
        if !hasData {
            return
        }
        
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "", sender: nil)
        case 1:
            let value = data[indexPath.row]
            if value.status == "approved" {
                performSegue(withIdentifier: "ServiceEndedSegue", sender: value)
            }else{
                performSegue(withIdentifier: "ServiceOngoingSegue", sender: value)
            }
        case 2:
            performSegue(withIdentifier: "ServiceEndedSegue", sender: data[indexPath.row])
        case 3:
            performSegue(withIdentifier: "ServiceEndedSegue", sender: data[indexPath.row])
        default:
            break;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension ServicesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ServiceOngoingSegue" || segue.identifier == "ServiceEndedSegue" {
            let viewController = segue.destination as! OngoingServiceViewController
            viewController.data = sender as? ServiceBody
            viewController.serviceView = self
        }
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

//
//  OngoingServiceViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

class OngoingServiceViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var data: ServiceBody? = nil
    fileprivate let presenter = OngoingPresenter(apiManager: APIManager.default)
    
    @IBAction func approveAction(_ sender: Any) {
        let budgetId: Int = 0
        presenter.approveBudget(budgetId: budgetId)
    }
}

extension OngoingServiceViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if data != nil {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
}

extension OngoingServiceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [data?.status == "closed" ? 1 : 0,1,1,data?.budgetLines?.count ?? 0][section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "ServiceEndedCell")!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoSecondaryCell") as! ServiceInfoTableViewCell
            cell.data = "Factura \(data?.locator ?? "N/A") - \(data?.bike?.name ?? "")"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoPrimaryCell") as! ServiceInfoTableViewCell
            cell.data = "\(data?.reference ?? "")"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RevisionPriceCell") as! InfoPriceTableViewCell
            cell.data = ("\(data?.budgetLines?[indexPath.row].description ?? "")", "\(data?.budgetLines?[indexPath.row].price ?? "0")")
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}

extension OngoingServiceViewController: OngoingView {
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
    
    func approveBudgetSuccess() {
        
    }
}

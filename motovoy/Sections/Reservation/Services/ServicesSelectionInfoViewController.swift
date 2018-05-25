//
//  ServicesSelectionInfoViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

protocol ServicesSelectionInfoDelegate {
    func didSelect(service: String, value: ServiceMVSubKit)
}

class ServicesSelectionInfoViewController: UIViewController {
    
    var detailsRevision = ["Cambio aceite motor", "Reposición líquido refrigerante", "Reposición líquido de embrague", "Reposición líquido de frenos", "Revisión lámparas", "Estado contrapesos manillar", "Engrase kit de transmisión", "Tensado cadena transmisión", "Estado caballete y pata lateral", "Inspección de neumáticos", "Presión de neumáticos", "Estado cúpula"]
    var oilMarca = ["Economy","Quality","Premium"]
    var oilTypes = ["Mineral","Semisintético","Sintético"]
    var oilPrice = ["100€","150€","200€"]
    var arrayCheck = [true, false, false]
    
    @IBOutlet weak var tableView: UITableView!
    var delegate: ServicesSelectionInfoDelegate? = nil
    var kit: ServiceMVSubKit!
    
}

extension ServicesSelectionInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset.left = 0
        tableView.contentInset.bottom = 50
    }
    
}

extension ServicesSelectionInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [
            1,
            oilTypes.count,
            1,
            detailsRevision.count,
            1
        ][section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "ServiceInfoTitleCell")!
        case 1:
            if let c = tableView.dequeueReusableCell(withIdentifier: "RevisionPriceCell") as? InfoCheckableServiceTableViewCell {
                c.data = (oilMarca[indexPath.row], oilTypes[indexPath.row], oilPrice[indexPath.row], !arrayCheck[indexPath.row])
                cell = c
            }
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "RevisionHeaderCell")!
        case 3:
            if let c = tableView.dequeueReusableCell(withIdentifier: "ServiceItemInfoCell") as? InfoCheckServiceTableViewCell {
                c.data = (detailsRevision[indexPath.row], true)
                cell = c
            }
        case 4:
            if let c = tableView.dequeueReusableCell(withIdentifier: "ServiceActionCell") as? ActionTableViewCell {
                c.action = {
                    self.delegate?.didSelect(service: "\(self.oilMarca[self.arrayCheck.index(of: true) ?? 0]) \(self.oilTypes[self.arrayCheck.index(of: true) ?? 0])", value: self.kit)
                    self.navigationController?.popToRootViewController(animated: true)
                }
                cell = c
            }
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "RevisionHeaderCell")!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        arrayCheck = [indexPath.row == 0, indexPath.row == 1, indexPath.row == 2]
        tableView.reloadSections([1], with: UITableViewRowAnimation.automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

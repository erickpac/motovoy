//
//  BillingViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class BillingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var user: User? {
        get {
            return Utils.currentUser
        }
    }
    
}

extension BillingViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        prepareTabItem()
    }
    
    func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset.top = 20
        tableView.contentInset.bottom = 20
    }
    
    fileprivate func prepareTabItem() {
        tabItem.title = "FACTURACION"
        tabItem.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        tabItem.setTabItemColor(UIColor.darkGray, for: .normal)
        tabItem.setTabItemColor(UIColor.darkGray, for: .highlighted)
        tabItem.setTabItemColor(MColor.orange, for: .selected)
    }
    
}

extension BillingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAttributeCell") as! InfoTableViewCell
        switch indexPath.row {
        case 0:
            cell.data = ("Nombre", user?.name ?? "")
        case 1:
            cell.data = ("NIF", user?.nif ?? "")
        case 2:
            cell.data = ("Teléfono", user?.mobile ?? "")
        case 3:
            cell.data = ("Email", user?.email ?? "")
        default:
            cell.data = ("","")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

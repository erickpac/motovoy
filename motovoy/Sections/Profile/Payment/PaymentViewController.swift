//
//  PaymentViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var user: User? {
        get {
            return Utils.currentUser
        }
    }
    
}

extension PaymentViewController {
    
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
        tabItem.title = "TARJETAS"
        tabItem.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        tabItem.setTabItemColor(UIColor.darkGray, for: .normal)
        tabItem.setTabItemColor(UIColor.darkGray, for: .highlighted)
        tabItem.setTabItemColor(MColor.orange, for: .selected)
    }
    
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [
            0: 1,
            1: 1,
            ][section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            //let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAccountCell") as! CardTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyStateCell")
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAddAccountCell") as! ActionTableViewCell
            cell.action = {
                
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return [
            0: 100,//UITableViewAutomaticDimension
            1: 50
        ][indexPath.section]!
    }
    
}

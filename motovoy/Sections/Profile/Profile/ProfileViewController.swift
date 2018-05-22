//
//  ProfileViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var navigation: UINavigationController!
    fileprivate let presenter = ProfilePresenter(apiManager: APIManager.default)
    var address: [AddressBody] = [AddressBody]() {
        didSet {
            tableView.reloadData()
        }
    }
    var user: User? {
        get {
            return Utils.currentUser
        }
    }
}

extension ProfileViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        prepareTabItem()
        presenter.attachView(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoader(show: true)
        presenter.getAddress()
    }
    
    func configureTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset.top = 20
        tableView.contentInset.bottom = 20
    }
    
    fileprivate func prepareTabItem() {
        tabItem.title = "PERFIL"
        tabItem.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        tabItem.setTabItemColor(UIColor.darkGray, for: .normal)
        tabItem.setTabItemColor(UIColor.darkGray, for: .highlighted)
        tabItem.setTabItemColor(MColor.orange, for: .selected)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [
            0: 4,
            1: 1,
            2: address.count,
            3: 1,
            4: 1,
            5: 1
        ][section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
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
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTitleCell") as! SectionTitleTableViewCell
            cell.titleLabel.text = "DIRECCIONES"
            return cell
        case 2:
            if address.count > 0 {
                let data = address[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAddressCell") as! AddressTableViewCell
                cell.setData(data: data)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyStateCell")
                return cell!
            }
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAddAddressCell") as! ActionTableViewCell
            cell.action = {
                let sb = UIStoryboard.init(name: "Profile", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "AddressCreation")
                self.tabsController?.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileShareCell") as! ActionTableViewCell
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileSignOutCell") as! ActionTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return [
            0: 50,
            1: 60,
            2: address.count == 0 ? 100 : UITableViewAutomaticDimension,
            3: 72,
            4: 72,
            5: 72
            ][indexPath.section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 5:
            if indexPath.row == 0 {
                Utils.logOut()
            }
            break
        default:
            break
        }
    }
}

extension ProfileViewController: ProfileView {
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
    
    func getAddressSuccess(address: [AddressBody]) {
        self.address = address
    }
    
    func deleteAddressSuccess() {
        
    }
}

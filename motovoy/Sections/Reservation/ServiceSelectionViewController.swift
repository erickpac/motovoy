//
//  ServiceSelectionViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ServiceSelectionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

}

extension ServiceSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [
            0,
            0,
            0,
            0,
            0,
            0
        ][section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceNameCell") as! ServiceSelectionInfoTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

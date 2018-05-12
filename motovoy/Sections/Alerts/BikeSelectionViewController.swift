//
//  BikeSelectionViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material

class BikeSelectionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cardView: NavigationShadowedView!
    @IBOutlet var centerConstraint: NSLayoutConstraint!
    
    var modalTitle: String? = "SELECCIONAR MOTO"
    var buttonTitle: String? = "ANADIR NUEVA MOTO"
    
    var delegate: BikeSelectionDelegate? = nil
    var data: [Bike]! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

}

extension BikeSelectionViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAlert()
    }
    
    func configureAlert() {
        cardView.cornerRadiusPreset = .cornerRadius2
        cardView.backgroundColor = UIColor.white
    }
    
    func configure() {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
            self.centerConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0)
            self.centerConstraint.constant = 500
            self.view.layoutIfNeeded()
        }) { (completed) in
            if completed {
                super.viewWillDisappear(animated)
            }
        }
    }
    
    @IBAction func createBike() {
        UIView.animate(withDuration: 0.3, animations: {
            self.delegate?.createBike()
            self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0)
            self.centerConstraint.constant = 500
            self.view.layoutIfNeeded()
        }) { (completed) in
            if completed {
                super.dismiss(animated: false, completion: nil)
            }
        }
    }
    
}

extension BikeSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BikeSelection") as? BikeSelectionTableViewCell
        cell?.data = data[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let moto = data[indexPath.row]
        delegate?.didSelect(bike: moto)
    }
    
}

//
//  OptionSelectionAlertViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import Material

protocol OptionSelectionAlertDelegate {
    func didSelect(option: Int)
}

class OptionSelectionAlertViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cardView: NavigationShadowedView!
    @IBOutlet var centerConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var modalTitle: String? = "SELECCIONAR MOTO"
    var buttonTitle: String? = "ANADIR NUEVA MOTO"
    
    var delegate: ((Int) -> ())? = nil
    var buttonAction: (() -> ())? = nil
    var data: [String] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configure()
        reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAlert()
        configureTitles()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureTitles() {
        titleLabel.text = modalTitle
        button.setTitle(buttonTitle, for: .normal)
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
    
    func reload(){
        tableView.reloadData()
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
    
    func dismissView() {
        createBike()
    }
    
    @IBAction func createBike() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.backgroundColor = UIColor.darkGray.withAlphaComponent(0)
            self.centerConstraint.constant = 500
            self.view.layoutIfNeeded()
        }) { (completed) in
            if completed {
                super.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionSelection") as? InfoTableViewCell
        let key = data[indexPath.row]
        cell?.data = (key, key)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?(indexPath.row)
    }
    
}

//
//  ServiceTicketViewController.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

class ReservationTicketViewController: UIViewController {
    fileprivate let presenter = ServiceTicketPresenter(apiManager: APIManager.default)
    var invoiceId: Int?
    
    @IBAction func approveAction(_ sender: Any) {
        if let invoiceId = self.invoiceId {
            let stars: Int = 0
            let comment: String = ""
            presenter.sendRateService(invoiceId: invoiceId, stars: stars, comment: comment)
        }
    }
}

extension ReservationTicketViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
    }
}

extension ReservationTicketViewController: ServiceTicketView {
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
    
    func sendRateServiceSuccess() {
        
    }
}

//
//  ReservationDetailViewController.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

class ReservationDetailViewController: UIViewController {

    let presenter: ReservationDetailPresenter = ReservationDetailPresenter(apiManager: APIManager.default)
    
    var workshopId: Int!
    var isPickup: Bool!
    var slots: [DateSlotItem] = []
    var budget: BudgetBody? = nil
}

extension ReservationDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        presenter.getAvailableSlots(garageId: workshopId, isPickup: isPickup)
    }
    
}

extension ReservationDetailViewController: ReservationDetailView {
    
    func createBudgetSuccess(budget: Budget) {
        self.budget = budget.budget
        if let id = self.budget?.id {
            presenter.addCommentToBudget(budgetId: id, observations: "")
        }
    }
    
    func addImagesToBudgetSuccess() {
        //continue
    }
    
    func addCommentToBudgetSuccess() {
        if let id = self.budget?.id {
            presenter.addImagesToBudget(budgetId: id, images: [])
        }
    }
    
    func getAvailableSlotsSuccess(slots: [DateSlotItem]) {
        self.slots = slots
    }
    
    func showLoader(show: Bool) {
        if show {
            SVProgressHUD.show()
        }else {
            SVProgressHUD.dismiss()
        }
    }
    
    func errorMessage(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
}

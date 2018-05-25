//
//  RegistrationDetailPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class ReservationDetailPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ReservationDetailView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ReservationDetailView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func createBudget(garageId: Int, motoId: Int, calendarSlotId: Int, appoimentDate: String, kitsId: [Int], comment: String, address: String) -> Void {
        let params: [String: Any]
        params = [
            "workshop_id": garageId,
            "moto_id": motoId,
            "appointment_date": appoimentDate,
            "calendar_slot_id": calendarSlotId,
            "kits": kitsId,
            "comment": comment,
            "address": address
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.createBudget, params: params, onSuccess: { (response: GenericResponse) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.createBudgetSuccess()
                } else {
                    self.view?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.view?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Whoops, looks like something went wrong.")
        }
    }
    
    func addImagesToBudget() -> Void {
        
    }
    
    func addCommentToBudget(budgetId: Int, observations: String) -> Void {
        let params: [String: Any]
        params = [
            "budget_id": budgetId,
            "observations": observations
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.addCommentToBudget, params: params, onSuccess: { (response: GenericResponse) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.addCommentToBudgetSuccess()
                } else {
                    self.view?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.view?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Whoops, looks like something went wrong.")
        }
    }
}

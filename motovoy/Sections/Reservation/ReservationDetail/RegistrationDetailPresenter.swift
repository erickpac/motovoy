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
            
        }) { (error) in
            
        }
    }
    
    func addImagesToBudget() -> Void {
        
    }
    
    func addCommentToBudget() -> Void {
        
    }
}

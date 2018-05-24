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
    
    func createBudget() -> Void {
        
    }
    
    func addImagesToBudget() -> Void {
        
    }
    
    func addCommentToBudget() -> Void {
        
    }
}

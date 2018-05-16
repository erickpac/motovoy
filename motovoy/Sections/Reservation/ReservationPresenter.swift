//
//  ReservationPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class ReservationPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ReservationView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ReservationView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
}

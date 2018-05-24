//
//  ReservationTypePresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class ReservationTypePresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ReservationTypeView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ReservationTypeView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getGarages() -> Void {
        apiManager.postServiceModel(urlService: UrlPath.getGarages, params: [:], onSuccess: { (response: Garage) in
            if let status = response.status {
                if status.code == 200 {
                    if let garages = response.workshops {
                        self.view?.getGaragesSuccess(garages: garages)
                    }
                    self.view?.showLoader(show: false)
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

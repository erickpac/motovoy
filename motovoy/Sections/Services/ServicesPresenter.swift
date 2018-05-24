//
//  ServicesPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class ServicesPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ServicesView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ServicesView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getBudgets() -> Void {
        self.view?.showLoader(show: true)
        apiManager.postServiceModel(urlService: UrlPath.getBudgets, params: [:], onSuccess: { (response: Service) in
            if let status = response.status {
                if status.code == 200 {
                    if let services = response.budgets {
                        self.view?.getServicesSuccess(services: services)
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

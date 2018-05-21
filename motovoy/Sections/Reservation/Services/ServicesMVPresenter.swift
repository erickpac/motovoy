//
//  ServicesMVPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class ServicesMVPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ServicesMVView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ServicesMVView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getServices(motoId: String) -> Void {
        let params: [String: Any]
        params = ["moto_id": motoId]
        
        apiManager.postServiceModel(urlService: UrlPath.changePassword, params: params, onSuccess: { (response: ServiceMV) in
            if let status = response.status, let services = response.kits {
                if status.code == 200 {
                    self.view?.getServicesSuccess(services: services)
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
            self.view?.errorMessage(message: error.debugDescription)
        }
    }
}

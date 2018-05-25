//
//  ServiceTicketPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class ServiceTicketPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ServiceTicketView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ServiceTicketView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func sendRateService(invoiceId: Int, stars: Int, comment: String) -> Void {
        let params: [String: Any]
        params = [
            "invoice_id": invoiceId,
            "stars": stars,
            "comment": comment
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.rateService, params: params, onSuccess: { (response: GenericResponse) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.sendRateServiceSuccess()
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


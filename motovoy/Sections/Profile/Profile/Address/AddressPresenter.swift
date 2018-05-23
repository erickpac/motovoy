//
//  AddressPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class AddressPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: AddressView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: AddressView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func addAddress(address: String, streetNumber: String, city: String, postalCode: String, name: String, clientName: String = "", mobile: String = "") -> Void {
        let params: [String: Any]
        params = [
            "address": address,
            "city": city,
            "street_no": streetNumber,
            "postal_code": postalCode,
            "name": name,
            "client_name": clientName,
            "mobile": mobile
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.addAddress, params: params, onSuccess: { (response: GenericResponse) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.addAddressSuccess()
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

//
//  ProfilePresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class ProfilePresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ProfileView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ProfileView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getAddress() -> Void {
        apiManager.postServiceModel(urlService: UrlPath.getAddress, params: [:], onSuccess: { (response: Address) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    if let address = response.address {
                        self.view?.getAddressSuccess(address: address)
                    }
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
    
    func deleteAddress(addressId: Int) -> Void {
        let params: [String: Any]
        params = ["address_id": addressId]
        
        apiManager.postServiceModel(urlService: UrlPath.deleteAddress, params: params, onSuccess: { (response: GenericResponse) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.deleteAddressSuccess()
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

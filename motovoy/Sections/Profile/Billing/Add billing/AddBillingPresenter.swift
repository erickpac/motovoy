//
//  AddBillingPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class AddBillingPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: AddBillingView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: AddBillingView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func editProfile(name: String, lastName: String, nif: String, phone: String, email: String) -> Void {
        let params: [String: Any]
        params = [
            "name": name,
            "surnames": lastName,
            "nif": nif,
            "mobile": phone,
            "email": email
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.editProfile, params: params, onSuccess: { (response: User) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.editProfileSuccess(user: response)
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

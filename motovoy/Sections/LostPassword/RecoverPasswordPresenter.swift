//
//  RecoverPasswordPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class RecoverPasswordPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: RecoverPasswordView?
    fileprivate var phone: String = ""
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: RecoverPasswordView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getConfirmationCode(phone: String) -> Void {
        self.phone = phone
        let params: [String: Any]
        params = ["mobile": phone]
        
        apiManager.postServiceModel(urlService: UrlPath.getConfirmationCode, params: params, onSuccess: { (response: ConfirmationCode) in
            if let status = response.status {
                if status.code == 200 {
                    print("SMS => \(response.smsRegister?.first?.smsRegister ?? "")")
                    self.view?.showLoader(show: false)
                    self.view?.getConfirmationCodeSuccess()
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

//
//  RecoverPasswordPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class RecoverPasswordPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var recoverPasswordView: RecoverPasswordView?
    fileprivate var phone: String = ""
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: RecoverPasswordView) {
        recoverPasswordView = view
    }
    
    func detachView() {
        recoverPasswordView = nil
    }
    
    func getConfirmationCode(phone: String) -> Void {
        self.phone = phone
        let params: [String: Any]
        params = ["mobile": phone]
        
        apiManager.postServiceModel(urlService: UrlPath.getConfirmationCode, params: params, onSuccess: { (user: User) in
            if let status = user.status {
                if status.code == 200 {
                    self.recoverPasswordView?.showLoader(show: false)
                    self.recoverPasswordView?.getConfirmationCodeSuccess(phone: self.phone)
                } else {
                    self.recoverPasswordView?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.recoverPasswordView?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.recoverPasswordView?.showLoader(show: false)
            self.recoverPasswordView?.errorMessage(message: error.debugDescription)
        }
    }
}

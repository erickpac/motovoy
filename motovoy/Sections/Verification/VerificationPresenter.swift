//
//  VerificationPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Foundation

class VerificationPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: VerificationView?
    fileprivate var confirmationCode: String = ""
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: VerificationView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getConfirmationCode(phone: String) -> Void {
        let params: [String: Any]
        params = ["mobile": phone]
        
        apiManager.postServiceModel(urlService: UrlPath.getConfirmationCode, params: params, onSuccess: { (response: ConfirmationCode) in
            if let localStatus = response.status {
                if localStatus.code == 200 {
                    print("SMS => \(response.smsRegister?.first?.smsRegister ?? "")")
                    self.view?.showLoader(show: false)
                } else {
                    self.view?.showLoader(show: false)
                    if let errorMessage = localStatus.message {
                        self.view?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: error.debugDescription)
        }
    }
    
    func verificationAccount(phone: String, textMessage: String, isRecoveryPassword: Bool) -> Void {
        var params: [String: Any]
        params = [
            "mobile": phone,
            "text_message": textMessage
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.verifyAccount, params: params, onSuccess: { (response: ConfirmationCode) in
            if let status = response.status {
                if status.code == 200 {
                    if isRecoveryPassword {
                        self.view?.verificationChangePasswordSuccess()
                    } else {
                        if let loginToken = response.loginToken {
                            var userData: [String: Any] = [:]
                            userData["name"] = response.name ?? ""
                            userData["mobile"] = response.mobile ?? ""
                            userData["email"] = response.email ?? ""
                            userData["user_id"] = response.userId ?? 0
                            userData["nif"] = response.nif ?? ""
                            userData["credit_cards"] = response.creditCards ?? []
                            userData["status"] = [
                                "code": status.code ?? 200,
                                "message": status.message ?? "",
                                "login_token": loginToken
                            ]
                            
                            let jsonData = try? JSONSerialization.data(withJSONObject: userData, options: [])
                            let jsonString: String = String(data: jsonData!, encoding: .utf8)!
                            let _ = Utils.saveInUserDefaults(key: UserDefaultsKeys.USER_KEY, data: jsonString)
                        }
                        
                        self.view?.verificationAccountSuccess()
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
            self.view?.errorMessage(message: error.debugDescription)
        }
    }
}

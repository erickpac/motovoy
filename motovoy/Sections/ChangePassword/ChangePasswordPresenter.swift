//
//  ChangePasswordPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//
import Foundation

class ChangePasswordPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ChangePasswordView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ChangePasswordView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func resetPassword(phone: String) -> Void {
        var params: [String: Any]
        params = [
            "type": "sms",
            "mobile": phone
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.resetPassword, params: params, onSuccess: { (status: ConfirmationCode) in
            if let localStatus = status.status {
                if localStatus.code == 200 {
                    if let smsReset = status.smsReset, let tokenReset = status.tokenReset {
                        self.view?.resetPasswordSuccess(smsReset: smsReset, tokenReset: tokenReset)
                        self.view?.showLoader(show: false)
                    }
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
    
    func changePassword(password: String, phone: String, smsReset: String, tokenReset: String) -> Void {
        let params: [String: Any]
        params = [
            "mobile": phone,
            "new_password": password,
            "sms_reset": smsReset,
            "token_reset": tokenReset
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.changePassword, params: params, onSuccess: { (response: ConfirmationCode) in
            if let status = response.status {
                if status.code == 200 {
                    if let loginToken = response.loginToken {
                        let userData: [String: Any]
                        userData = [
                            "name": response.name ?? "",
                            "mobile": response.mobile ?? "",
                            "email": response.email ?? "",
                            "user_id": response.userId ?? 0,
                            "nif": response.nif ?? "",
                            "credit_cards": response.creditCards ?? [],
                            "status": [
                                "code": status.code ?? 200,
                                "message": status.message ?? "",
                                "login_token": loginToken
                            ]
                        ]
                        
                        let jsonData = try? JSONSerialization.data(withJSONObject: userData, options: [])
                        let jsonString: String = String(data: jsonData!, encoding: .utf8)!
                        let _ = Utils.saveInUserDefaults(key: UserDefaultsKeys.USER_KEY, data: jsonString)
                    }
                    
                    self.view?.changePasswordSuccess()
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

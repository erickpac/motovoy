//
//  LoginPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class LoginPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var loginView: LoginView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: LoginView) {
        loginView = view
    }
    
    func detachView() {
        loginView = nil
    }
    
    func loginProcess(emailPhone: String, password: String) -> Void {
        var params: [String: Any]
        if (emailPhone.contains("@") && emailPhone.contains(".")) {
            params = ["email": emailPhone]
        } else {
            params = ["mobile": emailPhone]
        }
        
        params["password"] = password
        
        apiManager.postServiceString(urlService: UrlPath.login, params: params, onSuccess: { (user) in
            if let userObject = User(jsonString: user) {
                if let status = userObject.status {
                    if status.code == 200 {
                        let _ = Utils.saveInUserDefaults(key: UserDefaultsKeys.USER_KEY, data: user)
                        self.loginView?.showLoader(show: false)
                        self.loginView?.loginSuccess()
                    } else {
                        self.loginView?.showLoader(show: false)
                        if let errorMessage = status.message {
                            self.loginView?.errorMessage(message: errorMessage)
                        }
                    }
                }
            }
        }) { (error) in
            self.loginView?.showLoader(show: false)
            self.loginView?.errorMessage(message: error.debugDescription)
        }
    }
}

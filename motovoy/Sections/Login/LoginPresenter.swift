//
//  LoginPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class LoginPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: LoginView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: LoginView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
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
                    if status.code == 102 {
                        self.view?.showLoader(show: false)
                        self.view?.loginAccountNotConfirm()
                    } else if status.code == 200 {
                        let _ = Utils.saveInUserDefaults(key: UserDefaultsKeys.USER_KEY, data: user)
                        self.view?.showLoader(show: false)
                        self.view?.loginSuccess()
                    } else {
                        self.view?.showLoader(show: false)
                        if let errorMessage = status.message {
                            self.view?.errorMessage(message: errorMessage)
                        }
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Whoops, looks like something went wrong.")
        }
    }
}

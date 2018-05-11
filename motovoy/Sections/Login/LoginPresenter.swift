//
//  LoginPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Foundation

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
    
    func loginProcess(emailPhone: String, password: String) {
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
                    }
                }
            }
        }) { (error) in
            
        }
    }
}

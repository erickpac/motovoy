//
//  RecoverPasswordPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Foundation

class RecoverPasswordPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var recoverPasswordView: RecoverPasswordView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: RecoverPasswordView) {
        recoverPasswordView = view
    }
    
    func detachView() {
        recoverPasswordView = nil
    }
    
    func recoverPasswordProcess(phone: String) -> Void {
        let params: [String: Any]
        params = ["mobile": phone]
        
        apiManager.postServiceModel(urlService: UrlPath.getConfirmationCode, params: params, onSuccess: { (user: User) in
            if let status = user.status {
                
            }
        }) { (error) in
            print("error -> \(error.debugDescription)")
        }
    }
}

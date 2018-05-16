//
//  VerificationPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class VerificationPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var verificationView: VerificationView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: VerificationView) {
        verificationView = view
    }
    
    func detachView() {
        verificationView = nil
    }
    
    func verificationAccount(mobile: String, textMessage: String) -> Void {
        var params: [String: Any]
        params = [
            "mobile": mobile,
            "text_message": textMessage
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.verifyAccount, params: params, onSuccess: { (status: GenericResponse) in
            if let status = status.status {
                if status.code == 200 {
                    self.verificationView?.verificationSuccess()
                    self.verificationView?.showLoader(show: false)
                } else {
                    self.verificationView?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.verificationView?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            
        }
    }
}

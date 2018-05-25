//
//  OngoingPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class OngoingPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: OngoingView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: OngoingView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func approveBudget(budgetId: Int) -> Void {
        let params: [String: Any]
        params = ["budget_id": budgetId]
        
        apiManager.postServiceModel(urlService: UrlPath.approveBudget, params: params, onSuccess: { (response: GenericResponse) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.approveBudgetSuccess()
                } else {
                    self.view?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.view?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Whoops, looks like something went wrong.")
        }
    }
}

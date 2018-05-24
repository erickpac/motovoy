//
//  MessagesPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class MessagesPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: MessagesView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: MessagesView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getMessages() -> Void {
        self.view?.showLoader(show: true)
        apiManager.postServiceModel(urlService: UrlPath.getMessages, params: [:], onSuccess: { (message: Message) in
            if let status = message.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.getMessagesSuccess(messages: message.notifications ?? [])
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
    
    func markAsRead(idArray: [String]) -> Void {
        let params: [String: Any]
        params = [
            "notification_ids": idArray
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.getMessages, params: params, onSuccess: { (message: Message) in
            if let status = message.status {
                if status.code == 200 {
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
            self.view?.errorMessage(message: "Whoops, looks like something went wrong.")
        }
    }
}

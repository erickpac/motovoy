//
//  MessagesPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class MessagesPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var messagesView: MessagesView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: MessagesView) {
        messagesView = view
    }
    
    func detachView() {
        messagesView = nil
    }
    
    func getMessages() -> Void {
        apiManager.postServiceModel(urlService: UrlPath.getMessages, params: [:], onSuccess: { (message: Message) in
            if let status = message.status {
                if status.code == 200 {
                    self.messagesView?.showLoader(show: false)
                } else {
                    self.messagesView?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.messagesView?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.messagesView?.showLoader(show: false)
            self.messagesView?.errorMessage(message: error.debugDescription)
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
                    self.messagesView?.showLoader(show: false)
                } else {
                    self.messagesView?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.messagesView?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.messagesView?.showLoader(show: false)
            self.messagesView?.errorMessage(message: error.debugDescription)
        }
    }
}

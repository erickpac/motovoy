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
}

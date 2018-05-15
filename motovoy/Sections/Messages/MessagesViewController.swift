//
//  MessagesViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD

class MessagesViewController: BaseNavigationViewController {
    fileprivate let messagesPresenter = MessagesPresenter(apiManager: APIManager())
    var messages: [MessageBody]? = nil
    
    @IBAction func markAasReadAction(_ sender: Any) {
        messagesPresenter.markAsRead(idArray: [""])
    }
}

extension MessagesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesPresenter.attachView(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        messagesPresenter.getMessages()
    }
}

extension MessagesViewController: MessagesView {
    func showLoader(show: Bool) {
        if show {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    func errorMessage(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
    func getMessagesSuccess(messages: [MessageBody]) {
        self.messages = messages
    }
    
    func markAasReadMessageSuccess() {
        
    }
}

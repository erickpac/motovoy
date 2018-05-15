//
//  MessagesViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import APESuperHUD

class MessagesViewController: UIViewController {
    fileprivate let messagesPresenter = MessagesPresenter(apiManager: APIManager.default)
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
            APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: "Cargando...", presentingView: self.view)
        } else {
            APESuperHUD.removeHUD(animated: true, presentingView: self.view, completion: nil)
        }
    }
    
    func errorMessage(message: String) {
        APESuperHUD.showOrUpdateHUD(icon: .sadFace, message: message, duration: 3.0, presentingView: self.view, completion: nil)
    }
    
    func getMessagesSuccess(messages: [MessageBody]) {
        self.messages = messages
    }
    
    func markAasReadMessageSuccess() {
        
    }
}

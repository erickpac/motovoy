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
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var tableView: UITableView!
    fileprivate let messagesPresenter = MessagesPresenter(apiManager: APIManager.default)
    var messages: [MessageBody] = [MessageBody]() {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.estimatedRowHeight = 100
            tableView.reloadData()
        }
    }
    
    @IBAction func markAasReadAction(_ sender: Any) {
        messagesPresenter.markAsRead(idArray: [""])
    }
}

extension MessagesViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        messagesPresenter.attachView(self)
        messagesPresenter.getMessages()
    }
}

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = messages[indexPath.row]
        let cell: MessageTableViewCell = tableView.dequeueReusableCell(withIdentifier: data.readAt == nil ? "MessageOn" : "MessageOff") as! MessageTableViewCell
        cell.data = data
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension MessagesViewController: MessagesView {
    func showLoader(show: Bool) {
        if show {
            if (messages.count != 0) {
                return;
            }
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

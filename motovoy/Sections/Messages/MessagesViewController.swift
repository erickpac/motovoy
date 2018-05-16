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
            tableView.reloadData()
        }
    }
    
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

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BikeShowcaseLastService")
        return cell!
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

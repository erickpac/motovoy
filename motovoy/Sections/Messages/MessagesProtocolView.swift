//
//  MessagesProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol MessagesView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
}

//
//  LoginProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Foundation

protocol LoginView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func loginSuccess(user: User)
}

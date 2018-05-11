//
//  RecoverPasswordProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol RecoverPasswordView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func recoverySuccess()
}

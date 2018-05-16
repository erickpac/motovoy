//
//  ChangePasswordProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol ChangePasswordView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func resetPasswordSuccess(smsReset: String, tokenReset: String)
    func changePasswordSuccess()
}

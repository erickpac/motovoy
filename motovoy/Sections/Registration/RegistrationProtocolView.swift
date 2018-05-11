//
//  RegistrationProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol RegistrationView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func registrationSuccess()
}

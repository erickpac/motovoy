//
//  AddBillingProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol AddBillingView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func editProfileSuccess(user: User)
}

//
//  AddressProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol AddressView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func addAddressSuccess()
}

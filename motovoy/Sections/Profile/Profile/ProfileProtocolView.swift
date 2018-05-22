//
//  ProfileProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol ProfileView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func getAddressSuccess(address: [AddressBody])
    func deleteAddressSuccess()
}


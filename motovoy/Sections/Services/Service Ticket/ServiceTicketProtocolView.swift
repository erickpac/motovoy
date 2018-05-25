//
//  ServiceTicketProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol ServiceTicketView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func sendRateServiceSuccess()
}


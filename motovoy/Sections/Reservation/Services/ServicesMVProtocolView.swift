//
//  ServicesMVProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol ServicesMVView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func getServicesSuccess(services: [ServicesMV])
}

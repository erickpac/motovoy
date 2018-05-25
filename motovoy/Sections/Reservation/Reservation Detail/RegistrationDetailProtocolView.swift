//
//  RegistrationDetailProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol ReservationDetailView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func createBudgetSuccess()
    func addImagesToBudgetSuccess()
    func addCommentToBudgetSuccess()
}

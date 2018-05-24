//
//  BudgetModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct Budget: LocalMappable {
    let name: String?
    let mobile: String?
    let email: String?
    let userId: Int?
    let nif: String?
    let apiVersion: String?
    let creditCards: [CustomerCreditCard]?
    let status: Status?
    let workshop: BudgetGarage?
    let budget: BudgetBody?
    let appointment: BudgetAppointment?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case mobile = "mobile"
        case email = "email"
        case userId = "user_id"
        case nif = "nif"
        case apiVersion = "api_version"
        case creditCards = "credit_cards"
        case status = "status"
        case workshop = "workshop"
        case budget = "budget"
        case appointment = "appointment"
    }
}

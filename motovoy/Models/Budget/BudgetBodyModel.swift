//
//  BudgetBodyModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BudgetBody: Codable {
    let id: Int?
    let name: String?
    let date: String?
    let locator: Int?
    let reference: String?
    let status: String?
    let observations: String?
    let moto: BudgetBodyBike?
    let appointment: [BudgetBodyAppointment]?
    let price: String?
    let budgetLines: [BudgetBodyLine]?
    let diagnostics: [BudgetBodyDiagnostic]?
    let invoices: [BudgetBodyInvoice]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case date = "date"
        case locator = "locator"
        case reference = "reference"
        case status = "status"
        case observations = "observations"
        case moto = "moto"
        case appointment = "appointment"
        case price = "price"
        case budgetLines = "budget_lines"
        case diagnostics = "diagnostics"
        case invoices = "invoices"
    }
}

//
//  ServiceBodyModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ServiceBody: Codable {
    let id: Int?
    let name: String?
    let date: String?
    let locator: String?
    let reference: String?
    let status: String?
    let observations: String?
    let bike: ServiceBodyBike?
    let appointment: [ServiceBodyAppointment]?
    let price: String?
    let budgetLines: [BudgetBodyLine]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case date = "date"
        case locator = "locator"
        case reference = "reference"
        case status = "status"
        case observations = "observations"
        case bike = "moto"
        case appointment = "appointment"
        case price = "price"
        case budgetLines = "budget_lines"
    }
}

//
//  ServiceBodyBudgetLineModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ServiceBodyBudgetLine: Codable {
    let id: Int?
    let parentBudgetLineID: Int?
    let reference: String?
    let status: String?
    let description: String?
    let discount: String?
    let tax: String?
    let quantity: String?
    let price: String?
    let amount: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case parentBudgetLineID = "parent_budget_line_id"
        case reference = "reference"
        case status = "status"
        case description = "description"
        case discount = "discount"
        case tax = "tax"
        case quantity = "quantity"
        case price = "price"
        case amount = "amount"
    }
}

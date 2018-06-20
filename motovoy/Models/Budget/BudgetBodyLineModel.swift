//
//  BudgetBodyLineModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BudgetBodyLine: Codable {
    var id: Int?
    var parentBudgetLineId: Int?
    var reference: String?
    var status: String?
    var description: String?
    var discount: Float?
    var tax: Float?
    var quantity: String?
    var price: String?
    var amount: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case parentBudgetLineId = "parent_budget_line_id"
        case reference
        case status
        case description
        case discount
        case tax
        case quantity
        case price
        case amount
    }
}

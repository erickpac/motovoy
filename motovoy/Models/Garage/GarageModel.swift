//
//  GarageModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct Garage: LocalMappable {
    let name: String?
    let mobile: String?
    let email: String?
    let userID: Int?
    let nif: String?
    let apiVersion: String?
    let creditCards: [CustomerCreditCard]?
    let status: Status?
    let workshops: [GarageBody]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case mobile = "mobile"
        case email = "email"
        case userID = "user_id"
        case nif = "nif"
        case apiVersion = "api_version"
        case creditCards = "credit_cards"
        case status = "status"
        case workshops = "workshops"
    }
}

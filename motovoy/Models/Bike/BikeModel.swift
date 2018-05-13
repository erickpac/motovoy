//
//  BikeModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/9/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct Bike: LocalMappable {
    var name: String?
    var mobile: String?
    var email: String?
    var userId: Int?
    var nif: String?
    var creditCards: [CustomerCreditCard]?
    var status: Status?
    var moto: [BikeBody]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case mobile
        case email
        case userId = "user_id"
        case nif
        case creditCards = "credit_cards"
        case status
        case moto
    }
}

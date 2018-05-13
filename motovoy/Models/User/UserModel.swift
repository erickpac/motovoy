//
//  UserModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/9/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct User: LocalMappable {
    var name: String?
    var mobile: String?
    var email: String?
    var userId: Int?
    var nif: String?
    var creditCards: [CustomerCreditCard]?
    var detail: CustomerDetail?
    var status: Status?
    var motos: [Bike]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case mobile
        case email
        case userId = "user_id"
        case nif
        case creditCards = "credit_cards"
        case detail = "client"
        case status
        case motos
    }
}

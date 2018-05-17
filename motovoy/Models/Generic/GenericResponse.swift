//
//  GenericResponse.swift
//  motovoy
//
//  Created by Jose Quintero on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct GenericResponse: LocalMappable {
    var name: String?
    var mobile: String?
    var email: String?
    var userId: Int?
    var nif: String?
    var creditCards: [CustomerCreditCard]?
    var status: Status?
    var loginToken: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case mobile
        case email
        case userId = "user_id"
        case nif
        case creditCards = "credit_cards"
        case status
        case loginToken = " login_token"
    }
}


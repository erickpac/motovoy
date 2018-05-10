//
//  CustomerCreditCardModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct CustomerCreditCard: Codable {
    var name: String?
    var number: String?
    var expirationDate: String?
    var securityCode: String? 
}

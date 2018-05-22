//
//  ServicesMVModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ServiceMV: LocalMappable {
    var name: String?
    var mobile: String?
    var email: String?
    var userId: Int?
    var nif: String?
    var creditCards: [CustomerCreditCard]?
    var status: Status?
    var kits: [ServiceMVKit]?
}

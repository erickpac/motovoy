//
//  AddressBodyModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/21/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct AddressBody: Codable {
    var id: Int?
    var clientId: Int?
    var name: String?
    var clientName: String?
    var address: String?
    var type: String?
    var city: String?
    var country: String?
    var postalCode: String?
    var mobile: String?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case clientId = "client_id"
        case name
        case clientName = "client_name"
        case address
        case type
        case city
        case country
        case postalCode = "postal_code"
        case mobile
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
    }
}


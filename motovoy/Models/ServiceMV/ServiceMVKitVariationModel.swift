//
//  ServiceMVKitVariationModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ServiceMVKitVariation: Codable {
    var id: Int?
    var kit_id: Int?
    var name: String?
    var description: String?
    var minCC: Int?
    var maxCC: Int?
    var kitPrice: Int?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    var fallback: Int?
    var calculatedPrice: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case kit_id = "kit_id"
        case name
        case description
        case minCC = "min_cc"
        case maxCC = "max_cc"
        case kitPrice = "kit_price"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case fallback
        case calculatedPrice = "calculated_price"
    }
}

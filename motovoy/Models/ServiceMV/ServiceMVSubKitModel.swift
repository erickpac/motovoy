//
//  ServiceMVSubKitModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ServiceMVSubKit: Codable {
    var id: Int?
    var name: String?
    var icon: String?
    var description: String?
    var iconPath: String?
    var kitVariations: [ServiceMVKitVariation]?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case icon
        case description = "user_id"
        case iconPath = "icon_path"
        case kitVariations = "kit_variations"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
    }
}

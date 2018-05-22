//
//  ServicesMVKitModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ServiceMVKit: Codable {
    var id: Int?
    var name: String?
    var icon: String?
    var description: String?
    var iconPath: String?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    var subKits: [ServiceMVSubKit]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case icon
        case description = "user_id"
        case iconPath = "icon_path"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case subKits = "kits"
    }
}

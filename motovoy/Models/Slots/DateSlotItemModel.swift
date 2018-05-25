//
//  DateSlotItemModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/25/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct DateSlotItem: Codable {
    let id: Int?
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case date = "date"
    }
}

//
//  DateSlotModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/25/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct DateSlot: LocalDate {
    let success: Bool?
    let data: [DateSlotItem]?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case data = "data"
        case message = "message"
    }
}

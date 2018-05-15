//
//  DateModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/15/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct LocalDate: Codable {
    var date: String?
    var timezoneType: Int?
    var timezone: String?
    
    enum CodingKeys: String, CodingKey {
        case date
        case timezoneType = "timezone_type"
        case timezone
    }
}

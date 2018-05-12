//
//  BrandVehicleModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BrandVehicle: Codable {
    var id: Int?
    var name: String?
    var cc: Int?
    var generalYearStart: Int?
    var generalYearEnd: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case cc
        case generalYearStart = "general__year_start"
        case generalYearEnd = "general__year_end"
    }
}

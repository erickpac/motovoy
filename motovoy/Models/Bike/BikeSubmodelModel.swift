//
//  BikeSubmodelModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BikeSubmodel: Codable {
    var id: Int?
    var name: String?
    var motoModelId: Int?
    var cc: Int?
    var generalYearStart: Int?
    var generalYearEnd: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case motoModelId = "moto_model_id"
        case cc
        case generalYearStart = "general__year_start"
        case generalYearEnd = "general__year_end"
    }
}

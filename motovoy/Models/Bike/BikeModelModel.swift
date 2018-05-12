//
//  BikeModelModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/9/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BikeModel: Codable {
    var id: Int?
    var name: String?
    var validated: Int?
    var brandId: Int?
    var brand: BikeBrand?
    var vehicles: [BikeVehicle]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case validated
        case brandId = "brand_id"
        case brand
        case vehicles
    }
}

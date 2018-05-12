//
//  BrandModelObjectModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BrandModel: Codable {
    var id: Int?
    var brandId: Int?
    var name: String?
    var vehicles: [BrandVehicle]?
}

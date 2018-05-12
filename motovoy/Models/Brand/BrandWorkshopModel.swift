//
//  BrandWorkshopModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BrandWorkshop: Codable {
    var id: Int?
    var code: String?
    var name: String?
    var address: String?
    var postalCode: String?
    var city: String?
    var province: String?
    var country: String?
    var phone: String?
    var email: String?
    var cif: String?
    var lat: String?
    var lng: String?
    var description: String?
    var services: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case name
        case address
        case postalCode = "postal_code"
        case city
        case province
        case country
        case phone
        case email
        case cif
        case lat
        case lng
        case description
        case services
    }
}

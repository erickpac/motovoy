//
//  GarageBodyModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//


struct GarageBody: Codable {
    let id: Int?
    let code: String?
    let name: String?
    let address: String?
    let postalCode: String?
    let city: String?
    let province: String?
    let country: String?
    let phone: String?
    let email: String?
    let cif: String?
    let lat: String?
    let lng: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case code = "code"
        case name = "name"
        case address = "address"
        case postalCode = "postal_code"
        case city = "city"
        case province = "province"
        case country = "country"
        case phone = "phone"
        case email = "email"
        case cif = "cif"
        case lat = "lat"
        case lng = "lng"
        case description = "description"
    }
}

//
//  ServiceBodyGarageModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ServiceBodyGarage: Codable {
    let id: Int?
    let code: String?
    let name: String?
    let address: String?
    let type: String?
    let postalCode: String?
    let city: String?
    let province: String?
    let country: String?
    let businessName: String?
    let description: String?
    let phone: String?
    let email: String?
    let cif: String?
    let invoicePattern: String?
    let rectifyPattern: String?
    let lastInvoice: String?
    let lastRectify: String?
    let lat: String?
    let lng: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case code = "code"
        case name = "name"
        case address = "address"
        case type = "type"
        case postalCode = "postal_code"
        case city = "city"
        case province = "province"
        case country = "country"
        case businessName = "business_name"
        case description = "description"
        case phone = "phone"
        case email = "email"
        case cif = "cif"
        case invoicePattern = "invoice_pattern"
        case rectifyPattern = "rectify_pattern"
        case lastInvoice = "last_invoice"
        case lastRectify = "last_rectify"
        case lat = "lat"
        case lng = "lng"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
    }
}

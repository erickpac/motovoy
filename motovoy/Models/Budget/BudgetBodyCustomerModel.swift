//
//  BudgetBodyCustomerModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BudgetBodyCustomer: Codable {
    let id: Int?
    let name: String?
    let surnames: String?
    let email: String?
    let mobile: String?
    let password: String?
    let countryID: Int?
    let nif: String?
    let invoiceName: String?
    let invoiceAddress: String?
    let invoicePostalCode: String?
    let invoiceCity: String?
    let invoiceContact: String?
    let invoicePhone: String?
    let payment: String?
    let status: String?
    let clientType: String?
    let lat: String?
    let lng: String?
    let robinson: Int?
    let token: String?
    let notificacionesEmail: Bool?
    let notificacionesPush: Bool?
    let notificacionesSMS: Bool?
    let rememberToken: String?
    let invoiceCif: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let holdedID: String?
    let cifNif: String?
    let fullName: String?
    let mobileNoPrefix: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case surnames = "surnames"
        case email = "email"
        case mobile = "mobile"
        case password = "password"
        case countryID = "country_id"
        case nif = "nif"
        case invoiceName = "invoice_name"
        case invoiceAddress = "invoice_address"
        case invoicePostalCode = "invoice_postal_code"
        case invoiceCity = "invoice_city"
        case invoiceContact = "invoice_contact"
        case invoicePhone = "invoice_phone"
        case payment = "payment"
        case status = "status"
        case clientType = "client_type"
        case lat = "lat"
        case lng = "lng"
        case robinson = "robinson"
        case token = "token"
        case notificacionesEmail = "notificaciones_email"
        case notificacionesPush = "notificaciones_push"
        case notificacionesSMS = "notificaciones_sms"
        case rememberToken = "remember_token"
        case invoiceCif = "invoice_cif"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case holdedID = "holded_id"
        case cifNif = "cif_nif"
        case fullName = "full_name"
        case mobileNoPrefix = "mobileNoPrefix"
    }
}

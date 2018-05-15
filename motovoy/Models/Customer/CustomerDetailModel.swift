//
//  CustomerDetailModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct CustomerDetail: Codable {
    var id: Int?
    var model: String?
    var name: String?
    var surName: String?
    var fullName: String?
    var email: String?
    var mobile: String?
    var mobilePrefix: String?
    var password: String?
    var countryId: Int?
    var nif: String?
    var invoiceName: String?
    var invoiceAddress: String?
    var invoicePostalCode: String?
    var invoiceCity: String?
    var invoiceContact: String?
    var invoicePhone: String?
    var invoiceCif: Int?
    var cifNif: Int?
    var payment: String?
    var status: String?
    var customerType: String?
    var latitude: String?
    var longitude: String?
    var robinson: Int?
    var token: String?
    var notifications: String?
    var notificationEmail: Bool?
    var notificationPush: Bool?
    var notificationSms: Bool?
    var rememberToken: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case surName = "surnames"
        case fullName = "full_name"
        case email
        case mobile
        case mobilePrefix = "mobileNoPrefix"
        case password
        case countryId = "country_id"
        case nif
        case invoiceName = "invoice_name"
        case invoiceAddress = "invoice_address"
        case invoicePostalCode = "invoice_postal_code"
        case invoiceCity = "invoice_city"
        case invoiceContact = "invoice_contact"
        case invoicePhone = "invoice_phone"
        case invoiceCif = "invoice_cif"
        case cifNif = "cif_nif"
        case payment
        case status
        case customerType = "client_type"
        case latitude = "lat"
        case longitude = "lng"
        case robinson
        case token
        case notifications
        case notificationEmail = "notificaciones_email"
        case notificationPush = "notificaciones_push"
        case notificationSms = "notificaciones_sms"
        case rememberToken = "remember_token"
    }
}

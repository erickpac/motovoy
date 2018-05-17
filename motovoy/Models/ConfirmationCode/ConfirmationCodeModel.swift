//
//  ConfirmationCodeModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ConfirmationCode: LocalMappable {
    var name: String?
    var mobile: String?
    var email: String?
    var userId: Int?
    var nif: String?
    var creditCards: [CustomerCreditCard]?
    var status: Status?
    var loginToken: String?
    var tokenReset: String?
    var smsReset: String?
    var smsRegister: [ConfirmationCodeSms]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case mobile
        case email
        case userId = "user_id"
        case nif
        case creditCards = "credit_cards"
        case status
        case loginToken = "login_token"
        case tokenReset = "token_reset"
        case smsReset = "sms_reset"
        case smsRegister = "sms_register"
    }
}

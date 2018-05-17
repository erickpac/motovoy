//
//  ConfirmationCodeSmsModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ConfirmationCodeSms: Codable {
    var smsRegister: String?
    var smsReset: String?
    
    enum CodingKeys: String, CodingKey {
        case smsRegister = "sms_register"
        case smsReset = "sms_reset"
    }
}

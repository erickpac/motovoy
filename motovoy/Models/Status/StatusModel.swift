//
//  StatusModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct Status: Codable {
    var code: Int?
    var message: String?
    var loginToken: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
        case loginToken = "login_token"
    }
}

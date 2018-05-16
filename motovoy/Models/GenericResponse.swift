//
//  GenericResponse.swift
//  motovoy
//
//  Created by Jose Quintero on 5/16/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct GenericResponse: LocalMappable {
    var status: Status?
    
    enum CodingKeys: String, CodingKey {
        case status
    }
}


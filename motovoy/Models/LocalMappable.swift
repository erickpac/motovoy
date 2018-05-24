//
//  LocalMappable.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Foundation

protocol LocalMappable: Decodable {
    init?(jsonString: String)
}

extension LocalMappable {
    init?(jsonString: String) {
        guard jsonString.count > 0 else {
            return nil
        }
        
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }
        
        self = try! JSONDecoder().decode(Self.self, from: data)
    }
}

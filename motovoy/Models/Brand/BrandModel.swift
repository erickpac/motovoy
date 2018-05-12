//
//  BrandModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct Brand: Codable {
    var id: Int?
    var name: String?
    var models: [BrandModel]?
}

//
//  BrandResourcesModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BrandResources: LocalMappable {
    var categories: [BrandCategory]?
    var brands: [Brand]?
    var workshops: [BrandWorkshop]?
}

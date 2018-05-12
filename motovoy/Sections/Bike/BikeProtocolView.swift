//
//  BikeProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol BikeView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func getBikeResourcesSuccess(brandResources: BrandResources)
}

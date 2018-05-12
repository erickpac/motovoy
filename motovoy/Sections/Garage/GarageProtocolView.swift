//
//  GarageProtocolView.swift
//  motovoy
//
//  Created by Erick Pac on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

protocol GarageView {
    func showLoader(show: Bool)
    func errorMessage(message: String)
    func getBikeSuccess(bikes: [Bike])
    func getHistorySuccess()
    func updateBikeSuccess()
    func deleteBikeSuccess()
}

//
//  BudgetBodyBikeModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BudgetBodyBike: Codable {
    let id: Int?
    let clientID: Int?
    let vehicleID: Int?
    let name: String?
    let matricula: String?
    let numBastidor: String?
    let matriculationDate: String?
    let insurance: String?
    let insuranceEndDate: String?
    let insuranceType: String?
    let lastRevision: String?
    let nextRevision: String?
    let lastItv: String?
    let itvEndDate: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case clientID = "client_id"
        case vehicleID = "vehicle_id"
        case name = "name"
        case matricula = "matricula"
        case numBastidor = "num_bastidor"
        case matriculationDate = "matriculation_date"
        case insurance = "insurance"
        case insuranceEndDate = "insurance_end_date"
        case insuranceType = "insurance_type"
        case lastRevision = "last_revision"
        case nextRevision = "next_revision"
        case lastItv = "last_itv"
        case itvEndDate = "itv_end_date"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
    }
}

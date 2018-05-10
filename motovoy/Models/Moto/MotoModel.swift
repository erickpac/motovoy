//
//  MotoModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/9/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct Moto: LocalMappable {
    var id: Int?
    var customerId: Int?
    var detailId: Int?
    var name: String?
    var matricula: String?
    var numBastidor: Int?
    var matriculationDate: String?
    var insurance: String?
    var insuranceEndDate: String?
    var insuranceType: String?
    var lastRevision: String?
    var nextRevision: String?
    var lastItv: String?
    var itvEndDate: String?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    var detail: MotoDetail?
    
    enum CodingKeys: String, CodingKey {
        case id
        case customerId = "client_id"
        case detailId = "vehicle_id"
        case name
        case matricula
        case numBastidor = "num_bastidor"
        case matriculationDate = "matriculation_date"
        case insurance
        case insuranceEndDate = "insurance_end_date"
        case insuranceType = "insurance_type"
        case lastRevision = "last_revision"
        case nextRevision = "next_revision"
        case lastItv = "last_itv"
        case itvEndDate = "itv_end_date"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case detail = "vehicle"
    }
}

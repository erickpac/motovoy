//
//  BIkeBodyModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//
import Foundation

struct BikeBody: Codable {
    var id: Int?
    var customerId: Int?
    var detailId: Int?
    var name: String?
    var matricula: String?
    var numBastidor: String?
    var matriculationDate: String?
    var insurance: String?
    var insuranceEndDate: LocalDate?
    var kmTotal: Int?
    var insuranceType: String?
    var lastRevision: LocalDate?
    var nextRevision: LocalDate?
    var lastItv: String?
    var itvEndDate: String?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?
    var detail: BikeDetail?
    var subModel: BikeSubmodel?
    var customer: CustomerDetail?
    var customerBike: CustomerDetail?
    var lastRevisionFormatted: String {
        let dateFormatterGet = DateFormatter()
        let dateFormatterPrint = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatterPrint.dateFormat = "dd MMMM, yyyy"
        dateFormatterPrint.locale = Locale(identifier: "en_US_POSIX")
        
        if let date = dateFormatterGet.date(from: "2016-02-29 12:24:26") {
            let dateString = dateFormatterPrint.string(from: date)
            return dateString
        }
        
        return ""
    }
    
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
        case kmTotal = "km_total"
        case insuranceType = "insurance_type"
        case lastRevision = "last_revision"
        case nextRevision = "next_revision"
        case lastItv = "last_itv"
        case itvEndDate = "itv_end_date"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case detail = "vehicle"
        case subModel = "Submodel"
        case customer = "client"
        case customerBike = "Client"
    }
}

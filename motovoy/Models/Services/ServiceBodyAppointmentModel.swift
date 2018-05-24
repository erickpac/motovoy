//
//  ServiceBodyAppointmentModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ServiceBodyAppointment: Codable {
    let id: Int?
    let budgetID: Int?
    let calendarID: Int?
    let depositID: Int?
    let datetime: String?
    let status: String?
    let type: String?
    let pickUpDateTime: String?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let deposit: String?
    let shipping: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case budgetID = "budget_id"
        case calendarID = "calendar_id"
        case depositID = "deposit_id"
        case datetime = "datetime"
        case status = "status"
        case type = "type"
        case pickUpDateTime = "pick_up_date_time"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case deposit = "deposit"
        case shipping = "shipping"
    }
}

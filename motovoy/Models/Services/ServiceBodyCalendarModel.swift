//
//  ServiceBodyCalendarModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/24/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct ServiceBodyCalendar: Codable {
    let id: Int?
    let workshopID: Int?
    let blocked: Bool?
    let schedule: String?
    let slots: Int?
    let createdAt: String?
    let updatedAt: String?
    let deletedAt: String?
    let startHour: String?
    let endHour: String?
    let workshop: ServiceBodyGarage?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case workshopID = "workshop_id"
        case blocked = "blocked"
        case schedule = "schedule"
        case slots = "slots"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case startHour = "start_hour"
        case endHour = "end_hour"
        case workshop = "workshop"
    }
}

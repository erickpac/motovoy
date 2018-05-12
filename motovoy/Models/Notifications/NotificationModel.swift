//
//  NotificationModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct Notification: Codable {
    var id: Int?
    var type: String?
    var notifiableId: Int?
    var notifiableType: String?
    var customer: NotificationCustomer?
    var readAt: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case notifiableId = "notifiable_id"
        case notifiableType = "notifiable_type"
        case customer = "data"
        case readAt = "read_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

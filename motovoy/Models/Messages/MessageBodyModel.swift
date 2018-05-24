//
//  MessagesBodyModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//
import Foundation

struct MessageBody: Codable {
    var id: String?
    var type: String?
    var notifiableId: Int?
    var notifiableType: String?
    var customer: MessageCustomer?
    var readAt: String?
    var createdAt: String?
    var updatedAt: String?
    var readAtFormatted: String {
        let dateFormatterGet = DateFormatter()
        let dateFormatterPrint = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatterPrint.dateFormat = "EEEE, dd MMMM yyyy"
        dateFormatterPrint.locale = Locale(identifier: "es_ES")
        
        if let date = dateFormatterGet.date(from: readAt ?? "") {
            let dateString = dateFormatterPrint.string(from: date)
            return dateString
        }
        
        return ""
    }
    var createdAtFormatted: String {
        let dateFormatterGet = DateFormatter()
        let dateFormatterPrint = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatterPrint.dateFormat = "EEEE, dd MMMM yyyy"
        dateFormatterPrint.locale = Locale(identifier: "es_ES")
        
        if let date = dateFormatterGet.date(from: createdAt ?? "") {
            let dateString = dateFormatterPrint.string(from: date)
            return dateString
        }
        
        return ""
    }
    
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

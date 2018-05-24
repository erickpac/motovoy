//
//  BudgetAppointmentModel.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

struct BudgetAppointment: Codable {
    var id: Int?
    var pickUpDateTime: String?
    var pickUpAddress: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case pickUpDateTime = "pick_up_date_time"
        case pickUpAddress = "pick_up_address"
    }
}

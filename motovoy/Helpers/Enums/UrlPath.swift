//
//  UrlPath.swift
//  motovoy
//
//  Created by Erick Pac on 5/9/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

enum UrlPath: String {
    case login = "/api/auth/login"
    case register = "/api/auth/register"
    case logout = "/api/logout"
    case confirmationCode = "/api/auth/confirmationCode"
    case getConfirmationCode = "/api/auth/getConfirmationCode"
    case brandResources = "/json/resources.json"
    case addEditBike = "/api/motos/addEditMoto"
    case getBikes = "/api/motos/getMotos"
    case deleteBike = "/api/motos/delete"
    case getMessages = "/api/notifications/getNotifications"
    case markAsReadMessage = "/api/notifications/markAsRead"
}

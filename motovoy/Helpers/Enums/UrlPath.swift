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
    case verifyAccount = "/api/auth/confirmationCode"
    case getConfirmationCode = "/api/auth/getConfirmationCode"
    case brandResources = "/json/resources.json"
    case changePassword = "/api/auth/password/changePassword"
    case resetPassword = "/api/auth/password/reset"
    case addEditBike = "/api/motos/addEditMoto"
    case getBikes = "/api/motos/getMotos"
    case deleteBike = "/api/motos/delete"
    case getMessages = "/api/notifications/getNotifications"
    case markAsReadMessage = "/api/notifications/markAsRead"
    case getKitsToService = "/api/kits/getKits"
    case getAddress = "/api/address/getAddress"
    case addAddress = "/api/addresses"
    case deleteAddress = "/api/address/delete"
    case editProfile = "/api/client/edit_profile"
    case getBudget = "/api/budgets/getBudgets"
    case createBudget = "/api/budgets/createBudget"
    case addImagesToBudget = "/api/budgets/addImages"
    case addCommentToBudget = "/api/budgets/addNoteToBudget"
    case approveBudget = "/api/budgets/approveBudget"
}

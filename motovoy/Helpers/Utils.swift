//
//  Utils.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Foundation

class Utils {
    static var currentUser: User?
    
    static func saveInUserDefaults(key: UserDefaultsKeys, data: Any) -> Bool {
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: key.rawValue)
        return userDefaults.synchronize()
    }
    
    static func getFromUserDefaults(key: UserDefaultsKeys) -> Any? {
        let userDefaults = UserDefaults.standard
        if let _ = userDefaults.object(forKey: key.rawValue) {
            return userDefaults.object(forKey: key.rawValue) as Any
        }
        
        return nil
    }
    
    static func removeFromUserDefaults(key: UserDefaultsKeys) -> Bool {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: key.rawValue)
        return userDefaults.synchronize()
    }
    
    static func getLoggedUser() -> User? {
        guard let _  = currentUser else {
            if let userString = Utils.getFromUserDefaults(key: UserDefaultsKeys.USER_KEY) as? String {
                if let user = User(jsonString: userString) {
                    currentUser = user
                }
            }
            
            return currentUser
        }
        
        return currentUser
    }
    
    static func logOut() -> Void {
        currentUser = nil
        let _ = removeFromUserDefaults(key: UserDefaultsKeys.USER_KEY)
        NotificationCenter.default.post(Notification.init(name: Notification.Name.init("LOGOUT_NOTIFICATION")))
    }
}

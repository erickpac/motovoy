//
//  Utils.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Foundation

class Utils {
    static func saveInUserDefaults(key: UserDefaultsKeys, data: Any) -> Bool {
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: key.rawValue)
        return userDefaults.synchronize()
    }
    
    static func getFromUserDefaults (key: UserDefaultsKeys) -> Any? {
        let userDefaults = UserDefaults.standard
        if let _ = userDefaults.object(forKey: key.rawValue) {
            return userDefaults.object(forKey: key.rawValue) as Any
        }
        
        return nil
    }
}

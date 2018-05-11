//
//  RegistrationPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/10/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Foundation
import CoreLocation

class RegistrationPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var registrationView: RegistrationView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: RegistrationView) {
        registrationView = view
    }
    
    func detachView() {
        registrationView = nil
    }
    
    func registrationProcess(name: String, email: String, phone: String, password: String) {
        var latitude: String = ""
        var longitude: String = ""
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) {
            let locationManager = CLLocationManager()
            locationManager.requestWhenInUseAuthorization()
            
            if let manager = locationManager.location {
                latitude = String(format: "%f", manager.coordinate.latitude)
                longitude = String(format: "%f", manager.coordinate.longitude)
            }
        }
        
        var params: [String: Any]
        params = [
            "name": name,
            "password": password,
            "password_confirmation": password,
            "mobile": phone,
            "email": email,
            "notificaciones_email": "1",
            "notificaciones_push": "1",
            "notificaciones_sms": "0",
            "lat": latitude,
            "lng": longitude
        ]
        
        apiManager.postServiceString(urlService: UrlPath.register, params: params, onSuccess: { (user) in
            if let userObject = User(jsonString: user) {
                if let status = userObject.status {
                    if status.code == 200 {
                        let _ = Utils.saveInUserDefaults(key: UserDefaultsKeys.USER_KEY, data: user)
                    }
                }
            }
        }) { (error) in
            
        }
    }
}
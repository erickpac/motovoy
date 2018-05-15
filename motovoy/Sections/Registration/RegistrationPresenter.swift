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
    fileprivate let locationManager = CLLocationManager()
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
        locationManager.requestWhenInUseAuthorization()
    }
    
    func attachView(_ view: RegistrationView) {
        registrationView = view
    }
    
    func detachView() {
        registrationView = nil
    }
    
    func registrationProcess(name: String, email: String, phone: String, password: String) -> Void {
        var latitude: String = ""
        var longitude: String = ""
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) {
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
        
        apiManager.postServiceString(urlService: UrlPath.register, params: params, onSuccess: { (userString) in
            if let user = User(jsonString: userString) {
                if let status = user.status {
                    if status.code == 200 {
                        let _ = Utils.saveInUserDefaults(key: UserDefaultsKeys.USER_KEY, data: userString)
                        self.registrationView?.showLoader(show: false)
                    } else {
                        self.registrationView?.showLoader(show: false)
                        if let errorMessage = status.message {
                            self.registrationView?.errorMessage(message: errorMessage)
                        }
                    }
                }
            }
        }) { (error) in
            self.registrationView?.showLoader(show: false)
            self.registrationView?.errorMessage(message: error.debugDescription)
        }
    }
}

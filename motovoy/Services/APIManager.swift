//
//  APIManager.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Alamofire

class APIManager {
    let URL_SERVICE = "https://backend.motovoy.com"
    let DEVICE_TYPE = "iOS"
    let DEVICE_ID = "1"
    
    func postServiceModel<T: LocalMappable>(urlService: UrlPath, params: [String: Any], onSuccess: @escaping(_ response: T) -> Void, onFailure: @escaping(_ error: Error?) -> Void) -> Void {
        let urlString: String = URL_SERVICE + urlService.rawValue
        guard let urlType = URL(string: urlString) else { return }
        
        var customParams: [String: Any] = params
        customParams["device_type"] = DEVICE_TYPE
        customParams["device_id"] = DEVICE_ID
        
        var urlRequest = URLRequest(url: urlType)
        urlRequest.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: customParams, options: [])
        
        Alamofire.request(urlRequest).responseString { (response) in
            switch response.result {
            case .success(let jsonString):
                onSuccess(T(jsonString: jsonString)!)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func postServiceString(urlService: UrlPath, params: [String: Any], onSuccess: @escaping(_ response: String) -> Void, onFailure: @escaping(_ error: Error?) -> Void) -> Void {
        let urlString: String = URL_SERVICE + urlService.rawValue
        guard let urlType = URL(string: urlString) else { return }
        
        var customParams: [String: Any] = params
        customParams["device_type"] = DEVICE_TYPE
        customParams["device_id"] = DEVICE_ID
        
        var urlRequest = URLRequest(url: urlType)
        urlRequest.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: customParams, options: [])
        
        Alamofire.request(urlRequest).responseString { (response) in
            switch response.result {
            case .success(let jsonString):
                onSuccess(jsonString)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func getServiceModel<T: LocalMappable>(urlService: UrlPath, onSuccess: @escaping(_ response: T) -> Void, onFailure: @escaping(_ error: Error?) -> Void) -> Void {
        let urlString: String = URL_SERVICE + urlService.rawValue
        guard let urlType = URL(string: urlString) else { return }
        
        var urlRequest = URLRequest(url: urlType)
        urlRequest.httpMethod = "GET"
        
        Alamofire.request(urlRequest).responseString { (response) in
            switch response.result {
            case .success(let jsonString):
                onSuccess(T(jsonString: jsonString)!)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
}

//
//  APIManager.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Alamofire

class APIManager {
    let URL_SERVICE = "http://motovoy.omatech.com"
    let DEVICE_TYPE = "iOS"
    let DEVICE_ID = "1"
    
    func postServiceModel<T: LocalMappable>(urlService: UrlPath, params: [String: Any], onSuccess: @escaping(_ response: T) -> Void, onFailure: @escaping(_ error: Error?) -> Void) -> Void {
        let urlString: String = URL_SERVICE + urlService.rawValue
        guard let urlType = URL(string: urlString) else { return }
        
        var customParams: [String: Any] = params
        customParams["device_type"] = DEVICE_ID
        customParams["device_id"] = DEVICE_TYPE
        
        Alamofire.request(urlType, method: .post, parameters: params, encoding: JSONEncoding.default).responseString { (response) in
            switch response.result {
            case .success(let jsonString):
                onSuccess(T(jsonString: jsonString)!)
                break
            case .failure(let error):
                onFailure(error)
                break
            }
        }
    }
}

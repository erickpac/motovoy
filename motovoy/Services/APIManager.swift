//
//  APIManager.swift
//  motovoy
//
//  Created by Erick Pac on 5/8/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import Alamofire
import SVProgressHUD

class APIManager {
    static var `default` = APIManager()
    
    let URL_SERVICE = "https://backend.motovoy.com"
    let DEVICE_TYPE = "iOS"
    let DEVICE_ID = "1"
    let API_VERSION = "1"
    
    func validate(response: DataResponse<String>) -> Bool {
        if let obj = GenericResponse(jsonString: response.result.value ?? "") {
            if obj.status?.code == 165 {
                Utils.currentUser = nil
                NotificationCenter.default.post(Notification.init(name: Notification.Name.init("LOGOUT_NOTIFICATION")))
                SVProgressHUD.dismiss()
                return false
            }else {
                return true
            }
        }
        
        return true
    }
    
    func postServiceModel<T: LocalMappable>(urlService: UrlPath, params: [String: Any], onSuccess: @escaping(_ response: T) -> Void, onFailure: @escaping(_ error: Error?) -> Void) -> Void {
        let urlString: String = URL_SERVICE + urlService.rawValue
        guard let urlType = URL(string: urlString) else { return }
        
        var customParams: [String: Any] = params
        customParams["device_type"] = DEVICE_TYPE
        customParams["device_id"] = DEVICE_ID
        customParams["api_version"] = API_VERSION
        if let user = Utils.getLoggedUser() {
            if let userId = user.userId {
                customParams["client_id"] = userId
            }
            
            if let userToken = user.status?.loginToken {
                customParams["login_token"] = userToken
            }
        }
        
        var urlRequest = URLRequest(url: urlType)
        urlRequest.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.timeoutInterval = 60
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: customParams, options: [])
        
        Alamofire.request(urlRequest).responseString { (response) in
            if (!self.validate(response: response)) {
                return
            }
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
        customParams["api_version"] = API_VERSION
        if let user = Utils.getLoggedUser() {
            if let userId = user.userId {
                customParams["client_id"] = userId
            }
            
            if let userToken = user.status?.loginToken {
                 customParams["login_token"] = userToken
            }
        }
        
        var urlRequest = URLRequest(url: urlType)
        urlRequest.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.timeoutInterval = 60
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: customParams, options: [])
        
        Alamofire.request(urlRequest).responseString { (response) in
            if (!self.validate(response: response)) {
                return
            }
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
        urlRequest.timeoutInterval = 60
        
        Alamofire.request(urlRequest).responseString { (response) in
            if (!self.validate(response: response)) {
                return
            }
            switch response.result {
            case .success(let jsonString):
                onSuccess(T(jsonString: jsonString)!)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
    
    func postServiceMultipartModel<T: LocalMappable>(urlService: UrlPath, params: [String: Any], images: [ImageData], onSuccess: @escaping(_ response: T) -> Void, onFailure: @escaping(_ error: Error?) -> Void) -> Void {
        let urlString: String = URL_SERVICE + urlService.rawValue
        guard let urlType = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: urlType)
        urlRequest.addValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        urlRequest.timeoutInterval = 60
        
        var customParams: [String: Any] = params
        customParams["device_type"] = DEVICE_TYPE
        customParams["device_id"] = DEVICE_ID
        customParams["api_version"] = API_VERSION
        if let user = Utils.getLoggedUser() {
            if let userId = user.userId {
                customParams["client_id"] = userId
            }
            
            if let userToken = user.status?.loginToken {
                customParams["login_token"] = userToken
            }
        }
        
//
//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//            for (key, value) in parameters {
//                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
//            }
//
//            if let data = imageData{
//                multipartFormData.append(data, withName: "image", fileName: "image.png", mimeType: "image/png")
//            }
//
//        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
//            switch result{
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    print("Succesfully uploaded")
//                    if let err = response.error{
//                        onError?(err)
//                        return
//                    }
//                    onCompletion?(nil)
//                }
//            case .failure(let error):
//                print("Error in upload: \(error.localizedDescription)")
//                onError?(error)
//            }
//        }
    }
}

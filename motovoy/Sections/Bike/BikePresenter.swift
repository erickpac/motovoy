//
//  BikePresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class BikePresenter {
    fileprivate let apiManager: APIManager
    fileprivate var bikeView: BikeView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: BikeView) {
        bikeView = view
    }
    
    func detachView() {
        bikeView = nil
    }
    
    func getBrands(phone: String) -> Void {
        apiManager.getServiceModel(urlService: UrlPath.brandResources, onSuccess: { (brands: BrandResources) in
            self.bikeView?.getBikeResourcesSuccess(brandResources: brands)
        }) { (error) in
            
        }
    }
    
    func newBike(name: String, brandId: String, model: Int, cylinderCapacity: Int, year: Int, registrationNumber: String) -> Void {
        let params: [String: Any]
        params = [
            "name": name,
            "brand_id": brandId,
            "engine_displacement": cylinderCapacity,
            "year": year,
            "matricula": registrationNumber
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.addEditBike, params: params, onSuccess: { (user: User) in
            if let status = user.status {
                if status.code == 200 {
                    self.bikeView?.showLoader(show: false)
                } else {
                    self.bikeView?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.bikeView?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.bikeView?.showLoader(show: false)
            self.bikeView?.errorMessage(message: error.debugDescription)
        }
    }
    
    func newCustomBike(brandName: String, modelName: String, motoName: String, registrationNumber: String, motorCC: String, year: Int) -> Void {
        let params: [String: Any]
        params = [
            "brand_name": brandName,
            "model_name": modelName,
            "moto_name": motoName,
            "matricula": registrationNumber,
            "motor_cc": motorCC,
            "year": year
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.addEditBike, params: params, onSuccess: { (user: User) in
            if let status = user.status {
                if status.code == 200 {
                    self.bikeView?.showLoader(show: false)
                } else {
                    self.bikeView?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.bikeView?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.bikeView?.showLoader(show: false)
            self.bikeView?.errorMessage(message: error.debugDescription)
        }
    }
}

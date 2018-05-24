//
//  BikePresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/11/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class BikePresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: BikeView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: BikeView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getBrands(phone: String) -> Void {
        apiManager.getServiceModel(urlService: UrlPath.brandResources, onSuccess: { (brands: BrandResources) in
            self.view?.getBikeResourcesSuccess(brandResources: brands)
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
                    self.view?.showLoader(show: false)
                } else {
                    self.view?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.view?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Ooooooops sucedió un error")
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
                    self.view?.showLoader(show: false)
                } else {
                    self.view?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.view?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Ooooooops sucedió un error")
        }
    }
}

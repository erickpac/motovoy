//
//  GaragePresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/12/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class GaragePresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: GarageView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: GarageView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getBikes() -> Void {
        self.view?.showLoader(show: true)
        apiManager.postServiceModel(urlService: UrlPath.getBikes, params: [:], onSuccess: { (bike: Bike) in
            if let status = bike.status {
                if status.code == 200 {
                    if let bikes = bike.moto {
                        self.view?.getBikeSuccess(bikes: bikes)
                        self.view?.showLoader(show: false)
                    }
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
    
    func getHistory() -> Void {
        
    }
    
    func updateBike(bikeId: Int,
                    name: String,
                    brandId: String,
                    numBastidor: String,
                    year: Int,
                    engineDisplacement: Int,
                    registrationNumber: String,
                    lastRevision: String,
                    insurance: String,
                    insuranceEndDate: String,
                    registrationNumberDate: String,
                    insuranceType: String,
                    nextRevision: String,
                    lastItv: String,
                    itvEndDate: String) -> Void {
        
        let params: [String: Any]
        params = [
            "vehicle_id": bikeId,
            "name": name,
            "brand_id": brandId,
            "num_bastidor": numBastidor,
            "year": year,
            "engine_displacement": engineDisplacement,
            "matricula": registrationNumber,
            "last_revision": lastRevision,
            "insurance": insurance,
            "insurance_end_date": insuranceEndDate,
            "matriculation_date": registrationNumberDate,
            "insurance_type": insuranceType,
            "next_revision": nextRevision,
            "last_itv": lastItv,
            "itv_end_date": itvEndDate
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.addEditBike, params: params, onSuccess: { (user: User) in
            if let status = user.status {
                if status.code == 200 {
                    self.view?.updateBikeSuccess()
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
            self.view?.errorMessage(message: error.debugDescription)
        }
    }
    
    func deleteBike(bikeId: Int) -> Void {
        let params: [String: Any]
        params = ["moto_id": bikeId]
        
        apiManager.postServiceModel(urlService: UrlPath.deleteBike, params: params, onSuccess: { (user: User) in
            if let status = user.status {
                if status.code == 200 {
                    self.view?.deleteBikeSuccess()
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

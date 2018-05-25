//
//  ReservationDetailPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//
import UIKit

class ReservationDetailPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ReservationDetailView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ReservationDetailView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func createBudget(garageId: Int, motoId: Int, calendarSlotId: Int = 0, pickCalendarSlotId: Int = 0, appoimentDate: String, kitsId: [Int], comment: String = "", address: String = "")  -> Void {
        var params: [String: Any]
        params = [
            "workshop_id": garageId,
            "moto_id": motoId,
            "kits": kitsId,
            "appointment_date": appoimentDate,
            "comment": comment,
            "address": address
        ]
        
        if calendarSlotId > 0 && pickCalendarSlotId == 0 {
            params["calendar_slot_id"] = calendarSlotId
        } else {
            params["pickup_calendar_slot_id"] = pickCalendarSlotId
        }
        
        apiManager.postServiceModel(urlService: UrlPath.createBudget, params: params, onSuccess: { (response: Budget) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.createBudgetSuccess(budget: response)
                } else {
                    self.view?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.view?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Whoops, looks like something went wrong.")
        }
    }
    
    func addImagesToBudget(budgetId: Int, images: [UIImage]) -> Void {
        let params: [String: Any]
        params = ["budget_id": budgetId]
        
        var sendImages: [ImageData] = []
        for (index, image) in images.enumerated() {
            sendImages.append(ImageData(name: "images[\(index)]", fileName: "image.jpeg", mimeType: "image/jpeg", imageData: UIImageJPEGRepresentation(image, 0.5)))
        }
        
        apiManager.postServiceMultipartModel(urlService: UrlPath.addImagesToBudget, params: params, images: sendImages, onSuccess: { (response: GenericResponse) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.addImagesToBudgetSuccess()
                } else {
                    self.view?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.view?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Whoops, looks like something went wrong.")
        }
    }
    
    func addCommentToBudget(budgetId: Int, observations: String) -> Void {
        let params: [String: Any]
        params = [
            "budget_id": budgetId,
            "observations": observations
        ]
        
        apiManager.postServiceModel(urlService: UrlPath.addCommentToBudget, params: params, onSuccess: { (response: GenericResponse) in
            if let status = response.status {
                if status.code == 200 {
                    self.view?.showLoader(show: false)
                    self.view?.addCommentToBudgetSuccess()
                } else {
                    self.view?.showLoader(show: false)
                    if let errorMessage = status.message {
                        self.view?.errorMessage(message: errorMessage)
                    }
                }
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Whoops, looks like something went wrong.")
        }
    }
    
    func getAvailableSlots(garageId: Int, isPickup: Bool) -> Void {
        let params: [String: Any]
        params = ["workshop_id": garageId]
        
        apiManager.postServiceModel(urlService: isPickup ? UrlPath.getAvailablePickup : UrlPath.getAvailableGarage, params: params, onSuccess: { (response: DateSlot) in
            if let _ = response.success {
                self.view?.showLoader(show: false)
                if let slots = response.data {
                    self.view?.getAvailableSlotsSuccess(slots: slots)
                }
            } else {
                self.view?.showLoader(show: false)
            }
        }) { (error) in
            self.view?.showLoader(show: false)
            self.view?.errorMessage(message: "Whoops, looks like something went wrong.")
        }
    }
}

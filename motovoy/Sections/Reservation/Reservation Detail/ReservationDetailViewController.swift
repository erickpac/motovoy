//
//  ReservationDetailViewController.swift
//  motovoy
//
//  Created by Erick Pac on 5/23/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit
import SVProgressHUD
import Material
import MapKit
import Photos
import PhotosUI

class ReservationDetailViewController: UIViewController {
    
//    @IBOutlet weak var 
    @IBOutlet weak var addressField: TextField!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var comment: TextField!
    @IBOutlet weak var dateField: TextField!
    @IBOutlet weak var timeField: TextField!
    @IBOutlet weak var mapView: MKMapView!
    
    let presenter: ReservationDetailPresenter = ReservationDetailPresenter(apiManager: APIManager.default)
    
    var workshop: GarageBody!
    var bikeId: Int!
    var isPickup: Bool!
    var selectedSlot: Int!
    var address: String!
    var slots: [DateSlotItem] = []
    var budget: BudgetBody? = nil
    var mainBudget: Budget!
    var kits: [String: ServiceMVSubKit] = [:]
    
    var dateSlot: DateSlotItem? = nil
    var timeSlot: DateSlotItem? = nil {
        didSet {
            selectedSlot = (timeSlot?.id ?? 0)
        }
    }
    var images: [(ImageData, UIImage)] = []
    var otherService: String = ""
    
}

extension ReservationDetailViewController {
    
    @IBAction func performAction(_ sender: Any) {
        presenter.createBudget(
            garageId: workshop.id ?? 0,
            motoId: bikeId,
            calendarSlotId: isPickup ? 0 : selectedSlot,
            pickCalendarSlotId: isPickup ? selectedSlot : 0,
            appoimentDate: "", kitsId: kits.map({$0.value.id ?? 0}),
            comment: comment != nil ? comment.text ?? "" : "",
            address: isPickup ? address : ""
        )
    }
    
}

extension ReservationDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        presenter.getAvailableSlots(garageId: workshop.id ?? 0, isPickup: isPickup)
        configureAddressField()
        configureCollectionView()
    }
    
    func configureAddressField() {
        if addressLabel != nil {
            addressLabel.text = workshop.address ?? ""

            mapView.setCamera(
                MKMapCamera.init(
                    lookingAtCenter: CLLocationCoordinate2D.init(latitude: CLLocationDegrees.init(Double.init(workshop.lat ?? "0") ?? 0), longitude: CLLocationDegrees.init(Double.init(workshop.lng ?? "0") ?? 0)),
                    fromDistance: 75,
                    pitch: 0,
                    heading: 0
            ), animated: false)
        }
    }
    
    func configureCollectionView() {
        imagesCollectionView.contentInset.left = 20
        imagesCollectionView.contentInset.right = 20
    }
    
}

extension ReservationDetailViewController: ReservationDetailView {
    
    func createBudgetSuccess(budget: Budget) {
        self.budget = budget.budget
        if let id = self.budget?.id {
            mainBudget = budget
            SVProgressHUD.show(withStatus: "Añadiendo Comentario")
            presenter.addCommentToBudget(budgetId: id, observations: otherService)
        }
    }
    
    func addImagesToBudgetSuccess() {
        performSegue(withIdentifier: "Ticket", sender: nil)
    }
    
    func addCommentToBudgetSuccess() {
        if let id = self.budget?.id {
            SVProgressHUD.show(withStatus: "Cargando Imagenes")
            presenter.addImagesToBudget(budgetId: id, images: images.map({$0.0}))
        }
    }
    
    func getAvailableSlotsSuccess(slots: [DateSlotItem]) {
        self.slots = slots
    }
    
    func showLoader(show: Bool) {
        if show {
            if !SVProgressHUD.isVisible() {
                SVProgressHUD.show()
            }
        }else {
            SVProgressHUD.dismiss()
        }
    }
    
    func errorMessage(message: String) {
        SVProgressHUD.showError(withStatus: message)
    }
    
}

extension ReservationDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? self.images.count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: ReservationImageCollectionViewCell!
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ReservationImageCollectionViewCell
            cell.image = self.images[indexPath.row].1
            return cell
        }else {
            let cell: UICollectionViewCell!
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewImageCell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let viewController = UIImagePickerController()
            viewController.sourceType = .photoLibrary
            viewController.delegate = self
            DispatchQueue.main.async {
                self.present(viewController, animated: true, completion: nil)
            }
        }else {
            self.images.remove(at: indexPath.row)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let path = info[UIImagePickerControllerImageURL] as! URL
        let image = (info[UIImagePickerControllerEditedImage] != nil ? info[UIImagePickerControllerEditedImage] : info[UIImagePickerControllerOriginalImage]) as! UIImage
        let name = path.relativeString.split(separator: "/").last?.description
        let asset = (
            ImageData.init(name: name, fileName: name, mimeType: "image/\(path.pathExtension)", imageData: UIImageJPEGRepresentation(image, 0.75)),
            image
        )
        
        self.images.append(asset)
        picker.dismiss(animated: true, completion: {
            self.imagesCollectionView.reloadSections([0])
        })
    }
}

extension ReservationDetailViewController {
    
    @IBAction func editTimeField() {
        performSegue(withIdentifier: "OptionSelectionSegue", sender: timeField)
    }
    
    @IBAction func editDateField() {
        performSegue(withIdentifier: "OptionSelectionSegue", sender: dateField)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? OptionSelectionAlertViewController {
            if let field = sender as? TextField {
                var dSlots: [String] = []
                viewController.data = self.slots.filter({ (item) -> Bool in
                    if field == dateField {
                        let slotExist = dSlots.index(of: String(item.date?.split(separator: " ").first ?? "")) != nil
                        if !slotExist {
                            dSlots.append(String(item.date?.split(separator: " ").first ?? ""))
                        }
                        return !slotExist
                    }else if field == timeField {
                        let current = String(self.dateSlot?.date?.split(separator: " ").first ?? "")
                        let value = String(item.date?.split(separator: " ").first ?? "")
                        return value == current
                    }else {
                        return false
                    }
                }).map({ (item) -> (String) in
                    if field == dateField {
                        return String(item.date?.split(separator: " ").first ?? "")
                    }else {
                        return String(item.date?.split(separator: " ").last ?? "")
                    }
                })
                viewController.modalTitle = "SELECCIONAR " + (field == dateField ? "FECHA" : "HORA")
                viewController.buttonTitle = "CANCELAR"
                viewController.buttonAction = {
                    viewController.dismiss(animated: true, completion: nil)
                }
                viewController.delegate = { index in
                    var dSlots: [String] = []
                    let items = self.slots.filter({ (item) -> Bool in
                        if field == self.dateField {
                            let slotExist = dSlots.index(of: String(item.date?.split(separator: " ").first ?? "")) != nil
                            if !slotExist {
                                dSlots.append(String(item.date?.split(separator: " ").first ?? ""))
                            }
                            return !slotExist
                        }else if field == self.timeField {
                            let current = String(self.dateSlot?.date?.split(separator: " ").first ?? "")
                            let value = String(item.date?.split(separator: " ").first ?? "")
                            return value == current
                        }else {
                            return false
                        }
                    })
                    if field == self.dateField {
                        self.dateSlot = items[index]
                    }else {
                        self.timeSlot = items[index]
                    }
                    field.text = viewController.data[index]
                    viewController.dismiss(animated: true, completion: nil)
                }
            }
        }else if let ticket = segue.destination as? ReservationConfirmationViewController {
            ticket.budget = mainBudget
            ticket.images = images.map({$0.1})
        }
    }
    
}

//
//  ReservationConfirmationViewController.swift
//  motovoy
//
//  Created by Jose Quintero on 5/29/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

import UIKit

class ReservationConfirmationViewController: UIViewController {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var workshopTitleLabel: UILabel!
    @IBOutlet weak var workshopAddressLabel: UILabel!
    @IBOutlet weak var workshopCountryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pickupAddressLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    var budget: Budget!
    var images: [UIImage]!
    
    @IBAction func popToRoot(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

extension ReservationConfirmationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        workshopTitleLabel.text = budget.workshop?.name ?? ""
        workshopAddressLabel.text = budget.workshop?.address ?? ""
        workshopCountryLabel.text = budget.workshop?.country ?? ""
        dateLabel.text = budget.budget?.date ?? ""
        timeLabel.text = budget.budget?.date ?? ""
        pickupAddressLabel.text = budget.appointment?.pickUpAddress ?? "Sin recogida / entrega."
        commentLabel.text = budget.budget?.observations ?? ""
    }
    
}

extension ReservationConfirmationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ReservationImageCollectionViewCell
        cell.image = images[indexPath.row]
        return cell
    }
}

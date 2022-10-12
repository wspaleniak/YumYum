//
//  PopularCollectionViewCell.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 12/10/2022.
//

import UIKit
import Kingfisher

class PopularCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: PopularCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
    
}

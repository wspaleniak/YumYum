//
//  SpecialsCollectionViewCell.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 12/10/2022.
//

import UIKit
import Kingfisher

class SpecialsCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: SpecialsCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var decriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        decriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }
}

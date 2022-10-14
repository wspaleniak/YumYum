//
//  DishDetailViewController.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 13/10/2022.
//

import UIKit
import Kingfisher

class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = dish.name
        populateView()
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }

    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        // ?
    }
    
}

//
//  HomeViewController.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 10/10/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    let categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish 1", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    let populars: [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", description: "This is the best dish I have ever tasted. Delicious!", calories: 34.123456789),
        .init(id: "id2", name: "Indomie", image: "https://picsum.photos/100/200", description: "This is the best dish I have ever tasted. Delicious!", calories: 59.456789123),
        .init(id: "id3", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best dish I have ever tasted. Delicious!", calories: 114.987654321)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
    }

    private func registerCells() {
        categoryCollectionView.register(
            UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier
        )
        popularCollectionView.register(
            UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

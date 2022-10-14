//
//  DishListViewController.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 14/10/2022.
//

import UIKit

class DishListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", description: "This is the best dish I have ever tasted. Delicious!", calories: 340.123456789),
        .init(id: "id2", name: "Indomie", image: "https://picsum.photos/100/200", description: "This is the best dish I have ever tasted. Delicious!", calories: 159.456789123),
        .init(id: "id3", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best dish I have ever tasted. Delicious!", calories: 1104.987654321)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
        registerCells()
    }

    private func registerCells() {
        tableView.register(
            UINib(nibName: DishListTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension DishListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}

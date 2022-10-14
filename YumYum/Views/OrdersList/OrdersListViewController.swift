//
//  OrdersListViewController.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 14/10/2022.
//

import UIKit

class OrdersListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id1",
              name: "Joe",
              dish: .init(id: "id1", name: "Garri", image: "https://picsum.photos/100/200", description: "This is the best dish I have ever tasted. Delicious!", calories: 340.123456789)),
        .init(id: "id2",
              name: "John",
              dish: .init(id: "id1", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best dish I have ever tasted. Delicious!", calories: 670.123456789)),
        .init(id: "id3",
              name: "Panicz",
              dish: .init(id: "id1", name: "Bolognese", image: "https://picsum.photos/100/200", description: "This is the best dish I have ever tasted. Delicious!", calories: 340.123456789))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        title = "Your Orders"
        registerCells()
    }

    private func registerCells() {
        tableView.register(
            UINib(nibName: DishListTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension OrdersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}

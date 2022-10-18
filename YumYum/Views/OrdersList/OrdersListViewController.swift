//
//  OrdersListViewController.swift
//  YumYum
//
//  Created by Wojciech Spaleniak on 14/10/2022.
//

import UIKit
import ProgressHUD

class OrdersListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        title = "Your Orders"
        registerCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        uploadBackend()
    }
    
    private func uploadBackend() {
        ProgressHUD.show()
        NetworkService.shared.fetchAllOrders { [weak self] result in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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

//
//  ViewController.swift
//  Month4-homework3
//
//  Created by Mac User on 4/11/23.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    private let tableView = UITableView()
    private let cell = "cell"
    private var goodsList: [Goods] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initUI()
    }


    private func initUI() {
        view.addSubview(tableView)
        setupConstraintsForTableView()
        
        initData()
    }
    
    private func setupConstraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GoodsTableViewCell.self, forCellReuseIdentifier: cell)
    }

    private func initData() {
        goodsList = [
                    Goods(image: "Sofa", name: "Furniture", count: "785 items", nameOfFurniture: "AbocoFur Modern Velvet Fabric Lazy Chair", stars: "Star", price: 700, infoGoods: "Office, Living Room \nYellow \nTextile, Velvet, Cotton \n25.6 x 31.5 x 37. inches \n20.3 Pounds"),
                    Goods(image: "Kitchen", name: "Kitchenware", count: "645 items", nameOfFurniture: "Modern Kitchen", stars: "Star", price: 1500, infoGoods: "Kitchen \nWhite, Black, Gray \nTile \n56.9 x 780.1 x 32.1 inches \n60 Pounds"),
                    Goods(image: "HeadPhones", name: "Reading Table", count: "inventory", nameOfFurniture: "Comfortable table", stars: "Star", price: 300, infoGoods: "Office, Bedroom, Living Room \nBrown, White \nTree \n67.3 x 15.69 x23.45 inches \n14 Pounds")
        ]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! GoodsTableViewCell
        cell.layer.cornerRadius = 11
        cell.clipsToBounds = true
        cell.initCellData(goodsList[indexPath.row])
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailsViewController()
        vc.goods = goodsList[indexPath.row]
        vc.initDataCell(goodsList[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

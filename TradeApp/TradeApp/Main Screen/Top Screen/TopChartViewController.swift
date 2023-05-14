//
//  TopChartViewController.swift
//  TradeApp
//
//  Created by Андрей  on 13.05.2023.
//

import UIKit

class TopChartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let topTraders: [Trader] = [
        Trader(country: nil, name: "Oliver", deposit: 2367, profit: 336755),
        Trader(country: nil, name: "Jack", deposit: 3645, profit: 345666),
        Trader(country: nil, name: "Hurry", deposit: 7685, profit: 456899),
        Trader(country: nil, name: "Jacob", deposit: 4567, profit: 678844),
        Trader(country: nil, name: "Charlie", deposit: 5678, profit: 346789),
        Trader(country: nil, name: "Thomas", deposit: 2457, profit: 345678),
        Trader(country: nil, name: "George", deposit: 76545, profit: 45679),
        Trader(country: nil, name: "Oscar", deposit: 345689, profit: 4535678),
        Trader(country: nil, name: "James", deposit: 8765, profit: 456785),
        Trader(country: nil, name: "Wiliam", deposit: 87445, profit: 4567898)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension TopChartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TraderTableViewCell
        cell.num.text = "\(indexPath.row + 1)"
        cell.name.text = topTraders[indexPath.row].name
        cell.deposit.text = "$\(topTraders[indexPath.row].deposit)"
        cell.profit.text = "$\(topTraders[indexPath.row].profit)"
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topTraders.count
    }
}



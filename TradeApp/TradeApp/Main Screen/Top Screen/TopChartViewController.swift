//
//  TopChartViewController.swift
//  TradeApp
//
//  Created by Андрей  on 13.05.2023.
//

import UIKit

class TopChartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var topTraders: [Trader] = [
        Trader(country: UIImage(named: "226-united-states"), name: "Oliver", deposit: 2367, profit: 336),
        Trader(country: UIImage(named: "243-canada"), name: "Jack", deposit: 3645, profit: 34),
        Trader(country: UIImage(named: "255-brazil"), name: "Hurry", deposit: 7685, profit: 45),
        Trader(country: UIImage(named: "094-south-korea"), name: "Jacob", deposit: 4567, profit: 67),
        Trader(country: UIImage(named: "162-germany"), name: "Charlie", deposit: 5678, profit: 346),
        Trader(country: UIImage(named: "255-brazil"), name: "Thomas", deposit: 2457, profit: 345),
        Trader(country: UIImage(named: "195-france"), name: "George", deposit: 76545, profit: 4567),
        Trader(country: UIImage(named: "121-new-zealand"), name: "Oscar", deposit: 345689, profit: 453),
        Trader(country: UIImage(named: "246-india"), name: "James", deposit: 8765, profit: 456),
        Trader(country: UIImage(named: "128-spain"), name: "Wiliam", deposit: 87445, profit: 45)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        executeRepeatedly()
    }
    private func executeRepeatedly() {
        
        changeProfit()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) { [weak self] in
            self?.executeRepeatedly()
        }
    }
    
   func changeProfit() {
        let step = Int.random(in: 50...150)
        let index = Int.random(in: 0..<topTraders.count)
        topTraders[index].profit += step
        tableView.reloadData()
    }
}

extension TopChartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TraderTableViewCell
        cell.num.text = "\(indexPath.row + 1)"
        cell.name.text = topTraders[indexPath.row].name
        cell.deposit.text = "$\(topTraders[indexPath.row].deposit)"
        cell.profit.text = "$\(topTraders[indexPath.row].profit)"
        cell.country.image = topTraders[indexPath.row].country
        cell.cellView?.backgroundColor = indexPath.row % 2 == 0 ? UIColor.theme.topGray : UIColor.theme.tradeLightGray
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topTraders.count
    }
}



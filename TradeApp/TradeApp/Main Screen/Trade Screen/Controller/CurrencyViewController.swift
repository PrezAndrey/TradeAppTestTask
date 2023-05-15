//
//  CurrencyViewController.swift
//  TradeApp
//
//  Created by Андрей  on 13.05.2023.
//

import UIKit

class CurrencyViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var cells: [Curency] = [
        Curency(cur: "GBD/USD", selected: false),
        Curency(cur: "EUR/USD", selected: false),
        Curency(cur: "GBD/USD", selected: false),
        Curency(cur: "EUR/USD", selected: false),
        Curency(cur: "GBD/USD", selected: false),
        Curency(cur: "EUR/USD", selected: false),
        Curency(cur: "GBD/USD", selected: false),
        Curency(cur: "EUR/USD", selected: false),
        Curency(cur: "EUR/USD", selected: false),
        Curency(cur: "EUR/USD", selected: false),
        Curency(cur: "GBD/USD", selected: false),
        Curency(cur: "GBD/USD", selected: false),
        Curency(cur: "EUR/USD", selected: false),
        Curency(cur: "GBD/USD", selected: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cells)
    }
    
    func select(indexPath: IndexPath) {
        for i in 0..<cells.count {
            if i == indexPath.row {
                cells[i].selected = !cells[i].selected
            }
            else {
                cells[i].selected = false
            }
        }
    }
}

extension CurrencyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "curency", for: indexPath) as! CurencyCollectionViewCell
        cell.configureView()
        cell.curencyLabel.text = cells[indexPath.row].cur
        cell.cellView.backgroundColor = cells[indexPath.row].selected ? UIColor.theme.green : UIColor.theme.tradeLightGray
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        select(indexPath: indexPath)
        collectionView.reloadData()
    }
    

    
    
}

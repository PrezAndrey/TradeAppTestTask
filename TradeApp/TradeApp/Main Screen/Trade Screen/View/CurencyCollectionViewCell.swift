//
//  CurencyCollectionViewCell.swift
//  TradeApp
//
//  Created by Андрей  on 15.05.2023.
//

import UIKit

class CurencyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var curencyLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    func selectView(curency: Curency) {
        if curency.selected {
            cellView.backgroundColor = UIColor.theme.green
        }
        else {
            cellView.backgroundColor = UIColor.theme.tradeLightGray
        }
    }
    
    func configureView() {
        cellView.layer.cornerRadius = 10
    }
}

//
//  TraderTableViewCell.swift
//  TradeApp
//
//  Created by Андрей  on 14.05.2023.
//

import UIKit

class TraderTableViewCell: UITableViewCell {

    @IBOutlet weak var profit: UILabel!
    @IBOutlet weak var deposit: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var num: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

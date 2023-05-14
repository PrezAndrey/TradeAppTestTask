//
//  Color.swift
//  TradeApp
//
//  Created by Андрей  on 13.05.2023.
//

import Foundation
import UIKit

extension UIColor {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let green = UIColor(named: "Green")
    let red = UIColor(named: "Red")
    let topGray = UIColor(named: "TopDarkGrey")
    let tradeGray = UIColor(named: "TradeDarkGrey")
    let tradeLightGray = UIColor(named: "TradeLightGray")
}

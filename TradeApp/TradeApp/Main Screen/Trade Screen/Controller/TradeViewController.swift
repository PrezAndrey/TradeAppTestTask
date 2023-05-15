//
//  TradeViewController.swift
//  TradeApp
//
//  Created by Андрей  on 13.05.2023.
//

import UIKit
import WebKit

/*
 https://www.tradingview.com/chart/sC5VhpjB/?symbol=FX%3AGBPUSD - GBP/USD
 https://www.tradingview.com/chart/sC5VhpjB/?symbol=FX%3AEURUSD - EUR/USD
 */

class TradeViewController: UIViewController {
    
    var pair = TradePair(balance: 10000, timer: 0.01, investment: 0)

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var investment: UITextField!
    @IBOutlet weak var timer: UITextField!
    @IBOutlet weak var investmentView: UIView!
    @IBOutlet weak var timerView: UIView!
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    @IBOutlet weak var currencyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        loadRequest(url: "https://www.tradingview.com/chart/sC5VhpjB/?symbol=FX%3AGBPUSD")
        updateUI()
    }
    
    
    @IBAction func didBuy(_ sender: Any) {
        pair.balance -= pair.investment
        updateUI()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.getProfit(investment: (self?.pair.investment)!)
        }
    }
    
    @IBAction func didSell(_ sender: Any) {
    }
    
    @IBAction func didChangeCurrency(_ sender: Any) {
    }
    
    @IBAction func didSubstructTimer(_ sender: Any) {
        pair.timer -= 0.01
        updateUI()
    }
    
    @IBAction func didAddTimer(_ sender: Any) {
        pair.timer += 0.01
        updateUI()
    }
    
    @IBAction func didSubstructInvestment(_ sender: Any) {
        pair.investment -= 100
        updateUI()
    }
    
    @IBAction func didAddInvestment(_ sender: Any) {
        pair.investment += 100
        updateUI()
    }
    
    func loadRequest(url: String) {
        guard let url = URL(string: url) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    func configureView() {
        let views = [balanceView, currencyButton, timerView, investmentView, sellButton, buyButton]
        for view in views {
            view!.layer.cornerRadius = 10
        }
    }
    
    func updateUI() {
        balance.text = "\(pair.balance)$"
        investment.text = "\(pair.investment)$"
        timer.text = "\(pair.timer)"
    }
    
    
    func getProfit(investment: Int) {
        let num = Int.random(in: 0...1)
        if num == 1 {
            pair.balance += investment + Int(investment / 100 * 7)
            balance.text = "\(pair.balance)$"
            balance.textColor = UIColor.theme.green
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.balance.textColor = .white
            }
        }
    }
}

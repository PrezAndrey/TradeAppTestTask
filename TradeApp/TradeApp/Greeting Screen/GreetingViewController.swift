//
//  StartingViewController.swift
//  TradeApp
//
//  Created by Андрей  on 13.05.2023.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet weak var persentage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var progressValue = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        persentage.text = "\(progressValue * 100)%"
        self.perform(#selector(setupProgress), with: nil, afterDelay: 0.4)
        
    }
    
    @objc func setupProgress() {
        
        progressValue += 0.1
        persentage.text = "\(progressValue * 100)%"
        self.progressBar.progress = Float(progressValue)
        
        if progressValue != 1.0 {
            self.perform(#selector(setupProgress), with: nil, afterDelay: 0.4)
        }
    }
}

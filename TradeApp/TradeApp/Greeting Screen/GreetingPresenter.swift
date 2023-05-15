//
//  GreetingPresenter.swift
//  TradeApp
//
//  Created by Андрей  on 16.05.2023.
//

import Foundation
import UIKit

protocol GreetingPresenterDescription {
    func present()
    func dismiss(completion: (() -> Void))
}

final class GreetingPresenter: GreetingPresenterDescription {
    
    private var foregroundGreetingWindow: UIWindow {
        let greetingWindow = UIWindow()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let greetingViewController = storyboard.instantiateViewController(withIdentifier: String(describing: GreetingViewController.self)) as? GreetingViewController
        greetingWindow.windowLevel = .normal + 1
        greetingWindow.rootViewController = greetingViewController
        
        return greetingWindow
    }
    
    func present() {
        foregroundGreetingWindow.isHidden = false
        
        let greetingViewController = foregroundGreetingWindow.rootViewController as? GreetingViewController
    }
    
    func dismiss(completion: (() -> Void)) {
        UIView.animate(withDuration: 0.3) {
            self.foregroundGreetingWindow.alpha = 0
        }
    }
    
    
    
}

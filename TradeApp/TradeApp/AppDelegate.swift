//
//  AppDelegate.swift
//  TradeApp
//
//  Created by Андрей  on 13.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var greetingPresenter: GreetingPresenterDescription? = GreetingPresenter()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        greetingPresenter?.present()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.greetingPresenter?.dismiss { [weak self] in
                self?.greetingPresenter = nil
            }
        }
        
        return true
    }

    
}


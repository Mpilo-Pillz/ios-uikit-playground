//
//  AppDelegate.swift
//  ios-uikit-playground
//
//  Created by Mpilo Pillz on 2022/09/04.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = MainViewController()
        window?.rootViewController = TableMainViewController()
        
        return true
    }

    
}




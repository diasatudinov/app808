//
//  AppDelegate.swift
//  app808
//
//  Created by Dias Atudinov on 28.08.2024.
//


import UIKit
import ApphudSDK
import YandexMobileMetrica

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: Info().appHudID)

        let configuration = YMMYandexMetricaConfiguration.init(apiKey: Info().metricaID)
        YMMYandexMetrica.activate(with: configuration!)
        
        print("AppDelegate: didFinishLaunchingWithOptions")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Handle app entering background
        print("AppDelegate: applicationDidEnterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Handle app entering foreground
        print("AppDelegate: applicationWillEnterForeground")
    }
    
    // Implement other UIApplicationDelegate methods as needed
}

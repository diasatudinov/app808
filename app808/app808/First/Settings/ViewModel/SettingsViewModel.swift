//
//  SettingsViewModel.swift
//  app808
//
//  Created by Dias Atudinov on 12.08.2024.
//

import SwiftUI
import StoreKit

class SettingsViewModel: ObservableObject {
    let standardNavBarHeight = UIScreen.main.bounds.height / 5.5
    
    func shareApp() {
        guard let url = URL(string: "https://apps.apple.com/app/win-your-way/id6651851652") else { return }
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
    
    func openUsagePolicy() {
        guard let url = URL(string: "https://www.termsfeed.com/live/d8c1e4cc-40b1-4cb4-b602-9b2f4b3a23b1") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

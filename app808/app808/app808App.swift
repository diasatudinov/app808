//
//  app808App.swift
//  app808
//
//  Created by Dias Atudinov on 09.08.2024.
//

import SwiftUI

@main
struct app808App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
           LoaderUIView()
            //ContentView()

        }
    }
}

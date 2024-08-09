//
//  ContentView.swift
//  app808
//
//  Created by Dias Atudinov on 09.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            VStack {
                Image("logo")
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

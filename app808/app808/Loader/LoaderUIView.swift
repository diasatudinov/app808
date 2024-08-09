//
//  LoaderUIView.swift
//  app808
//
//  Created by Dias Atudinov on 09.08.2024.
//

import SwiftUI

struct LoaderUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    @State private var isWeb: Bool = true
    
//    @State private var apiResponse: ApiResponse?
//    private let apiService = ApiService()
    @State private var errorMessage: String?
    
    @AppStorage("isRequested") var isRequested: Bool = false
    @AppStorage("isBlock") var isBlock: Bool = true
    @State var isDead: Bool = true

    
    var body: some View {
        if isLoadingView {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 371)
                        .padding(.top, UIScreen.main.bounds.height / 15)
                    Spacer()
                    ZStack {
                        
                        ProgressView(value: progress, total: 100)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(Color.loader)
                            .cornerRadius(15)
                            .scaleEffect(y: 2.5, anchor: .center)
                            .padding(.horizontal, 92)
                            
                    }
                    HStack {
                        Text("Loading")
                            
                            
                        
                        Text("\(Int(progress))%")
                    }
                    .font(.system(size: 17))
                  
                    .foregroundColor(.white)
                    .padding(14)
                    .padding(.bottom, 60)
                }
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                
            }
            
        } else {
            if true {
                ReOnboardingUIView()
                
            } else {
                UsOnboardingUIView()
            }
        }
    }
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isLoadingView.toggle()
            }
        }
    }
}

#Preview {
    LoaderUIView()
}

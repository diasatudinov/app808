//
//  ReOnboardingUIView.swift
//  app808
//
//  Created by Dias Atudinov on 09.08.2024.
//

import SwiftUI

struct ReOnboardingUIView: View {
    @State private var pageNum: Int = 1
    @State private var showSheet = false
    @AppStorage("signedUP") var signedUP: Bool = false
    
    var body: some View {
        if !signedUP {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    switch pageNum {
                    case 1: Image("appScreen1")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    case 2: Image("appScreen2")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    case 3: Image("appScreen3")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    default:
                        Image("appScreen3")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    }
                    
                    Button {
                        if pageNum < 3 {
                            pageNum += 1
                        } else {
                            signedUP = true
                        }
                    } label: {
                        Text("Next")
                            .foregroundColor(Color.white)
                            .font(.system(size: 17))
                            .padding()
                            .frame(maxWidth: .infinity)
                    }.background(Color.loader)
                        .cornerRadius(18)
                        .padding(.horizontal, 20)
                        .padding(.bottom)
                    
                }
                VStack {
                    HStack(spacing: 8) {
                        Rectangle()
                            .fill(pageNum == 1 ? Color.loader : Color.gray.opacity(0.5))
                            .frame(width: 35, height: 6)
                            .cornerRadius(19)
                        
                        Rectangle()
                            .fill(pageNum == 2 ? Color.loader : Color.gray.opacity(0.5))
                            .frame(width: 35, height: 6)
                            .cornerRadius(19)
                        
                        Rectangle()
                            .fill(pageNum > 2 ? Color.loader : Color.gray.opacity(0.5))
                            .frame(width: 35, height: 6)
                            .cornerRadius(19)
                    }
                    .padding()
                    switch pageNum {
                    case 1:
                        Text("Stop challenging yourself every day!")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(height: 70)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                    case 2:
                        Text("Track your progress and reach new heights!")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(height: 70)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                    case 3:
                        Text("Get badges for achieving \nresults!")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(height: 70)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                    default:
                        Text("Save information about \nyour favorite routes")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(height: 70)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        
                    }
                    
                }.padding(.bottom, UIScreen.main.bounds.height * 2/2.8)
            }
        
            
        } else {
            //TabUIView()
            //Text("AAAA")
        }
    }
    
//    func loadProfile() {
//        if let data = UserDefaults.standard.data(forKey: "profile"),
//           let decodedProfile = try? JSONDecoder().decode(ProfileModel.self, from: data) {
//            profile = decodedProfile
//        }
//
//        if let profile = profile {
//            signedUP = true
//        } else {
//            signedUP = false
//        }
//    }
}

#Preview {
    ReOnboardingUIView()
}

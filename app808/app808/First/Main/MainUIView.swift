//
//  MainUIView.swift
//  app808
//
//  Created by Dias Atudinov on 12.08.2024.
//

import SwiftUI

enum Views {
    case main, challenges, badges, diary, settings
}

struct MainUIView: View {
    @State private var view: Views = .main
    @ObservedObject var challengesVM = ChallengeViewModel()
    @ObservedObject var settingsVM = SettingsViewModel()
    @ObservedObject var badgesVM = BadgesViewModel()
    
    var body: some View {
        ZStack {
            Color.viewBg.ignoresSafeArea()
            switch view {
            case .main:
                VStack(spacing: 12) {
                    MainOne(view: $view)
                    HStack(spacing: 12) {
                        MainTwo(view: $view)
                        MainThree(view: $view)
                    }
                    MainFive(view: $view)
                    Spacer()
                    MainFour(view: $view)
                }.padding(.horizontal)
                    .padding(.top, 25)
            case .challenges:
                ChallengesUIView(viewModel: challengesVM, view: $view)
            case .badges:
                BadgesUIView(view: $view, viewModel: badgesVM, challengeVM: challengesVM)
            case .settings:
                SettingsUIView(viewModel: settingsVM, challengeVM: challengesVM, view: $view)
            case .diary:
                DiaryUIView(viewModel: DiaryViewModel(), view: $view, challangesVM: challengesVM)
            }
        }
    }
}

#Preview {
    MainUIView()
}

struct MainOne: View {
    @Binding var view: Views
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 325)
                    .padding(.top, -48)
                VStack(spacing: 7) {
                    Text("Create a challenge")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    Text("Add goals, complete them and achieve \nsuccess")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.7))
                }.padding(.top, -70)
                
                Button {
                    view = .challenges
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(height: 54)
                            .foregroundColor(.mainBtn)
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(16)
                        
                            Text("Start")
                                .font(.system(size: 17))
                            .foregroundColor(.white)
                    }.padding(.horizontal, 57)
                }.padding(.top, 24)
                
                Spacer()
            }
            
        }.cornerRadius(20)
            .frame(height: 407)
    }
}

struct MainTwo: View {
    @Binding var view: Views
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            
            VStack {
                Image(systemName: "tray.full.fill")
                    .font(.system(size: 22))
                    .foregroundColor(.mainBtn)
                    .padding()
                Text("My challenges")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                
                Button {
                    view = .challenges
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(height: 34)
                            .foregroundColor(.gray.opacity(0.24))
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(16)
                        
                            Text("Open")
                                .font(.system(size: 17))
                            .foregroundColor(.white)
                    }.padding(.horizontal, 53)
                        .padding(.top, 8)
                }
                
                Spacer()
            }
            
        }.cornerRadius(20)
            .frame(height: 154)
    }
}


struct MainThree: View {
    @Binding var view: Views
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            
            VStack {
                Image(systemName: "trophy.fill")
                    .font(.system(size: 19))
                    .foregroundColor(.mainBtn)
                    .padding()
                Text("Badges")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                
                Button {
                    view = .badges
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(height: 34)
                            .foregroundColor(.gray.opacity(0.24))
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(16)
                        
                            Text("Open")
                                .font(.system(size: 17))
                            .foregroundColor(.white)
                    }.padding(.horizontal, 53)
                        .padding(.top, 8)
                }
                
                Spacer()
            }
            
        }.cornerRadius(20)
            .frame(height: 154)
    }
}



struct MainFour: View {
    @Binding var view: Views
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            
            HStack {
                Image(systemName: "gear")
                    .font(.system(size: 22))
                    .foregroundColor(.mainBtn)
                    .padding()
                Text("Settings")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Button {
                    view = .settings
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: 66, height: 34)
                            .foregroundColor(.gray.opacity(0.24))
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(16)
                        
                            Text("Open")
                                .font(.system(size: 17))
                            .foregroundColor(.white)
                    }
                }.padding()
            }
            
        }.cornerRadius(20)
            .frame(height: 74)
    }
}

struct MainFive: View {
    @Binding var view: Views
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            
            HStack {
                Image(systemName: "doc.text.fill")
                    .font(.system(size: 22))
                    .foregroundColor(.mainBtn)
                    .padding()
                Text("Diary")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Button {
                    view = .diary
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: 66, height: 34)
                            .foregroundColor(.gray.opacity(0.24))
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(16)
                        
                            Text("Open")
                                .font(.system(size: 17))
                            .foregroundColor(.white)
                    }
                }.padding()
            }
            
        }.cornerRadius(20)
            .frame(height: 74)
    }
}

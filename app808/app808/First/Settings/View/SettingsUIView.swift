//
//  SettingsUIView.swift
//  app808
//
//  Created by Dias Atudinov on 12.08.2024.
//

import SwiftUI

struct SettingsUIView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @ObservedObject var challengeVM: ChallengeViewModel
    @Binding var view: Views
    var body: some View {
        ZStack {
            Color.viewBg.ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        view = .main
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 36, height: 36)
                                .cornerRadius(12)
                                .foregroundColor(.white.opacity(0.05))
                            Image(systemName: "xmark")
                                .foregroundColor(.gray.opacity(0.7))
                        }
                    }
                    Spacer()
                    
                    Text("Settings")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: 36, height: 36)
                            .foregroundColor(.clear)
                        
                    }
                }
                ScrollView {
                    VStack(spacing: 14) {
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(20)
                                .foregroundColor(.cardBg)
                            
                            
                            HStack(spacing: 15) {
                                
                                Image(systemName: "square.and.arrow.up.fill")
                                    .foregroundColor(.mainBtn)
                                    .font(.system(size: 22))
                                
                                Text("Share our app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                Spacer()
                                Button {
                                    viewModel.shareApp()
                                } label: {
                                    ZStack(alignment: .center) {
                                        Rectangle()
                                            .frame(width: 68, height: 34)
                                            .foregroundColor(.gray.opacity(0.24))
                                            .font(.system(size: 17, weight: .bold))
                                            .cornerRadius(16)
                                        
                                        Text("Share")
                                            .font(.system(size: 15))
                                            .foregroundColor(.white)
                                    }
                                }
                            }.padding()
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(20)
                                .foregroundColor(.cardBg)
                            
                            
                            HStack(spacing: 15) {
                                
                                Image(systemName: "star.square.fill")
                                    .foregroundColor(.mainBtn)
                                    .font(.system(size: 22))
                                
                                Text("Rate us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                Spacer()
                                Button {
                                    viewModel.rateApp()
                                } label: {
                                    ZStack(alignment: .center) {
                                        Rectangle()
                                            .frame(width: 68, height: 34)
                                            .foregroundColor(.gray.opacity(0.24))
                                            .font(.system(size: 17, weight: .bold))
                                            .cornerRadius(16)
                                        
                                        Text("Rate")
                                            .font(.system(size: 15))
                                            .foregroundColor(.white)
                                    }
                                }
                            }.padding()
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(20)
                                .foregroundColor(.cardBg)
                            
                            
                            HStack(spacing: 15) {
                                
                                Image(systemName: "person.badge.shield.checkmark.fill")
                                    .foregroundColor(.mainBtn)
                                    .font(.system(size: 22))
                                
                                Text("Usage policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                Spacer()
                                Button {
                                    viewModel.openUsagePolicy()
                                } label: {
                                    ZStack(alignment: .center) {
                                        Rectangle()
                                            .frame(width: 68, height: 34)
                                            .foregroundColor(.gray.opacity(0.24))
                                            .font(.system(size: 17, weight: .bold))
                                            .cornerRadius(16)
                                        
                                        Text("Read")
                                            .font(.system(size: 15))
                                            .foregroundColor(.white)
                                    }
                                }
                            }.padding()
                        }
                        
                        ZStack {
                            Rectangle()
                                .cornerRadius(20)
                                .foregroundColor(.cardBg)
                            
                            
                            HStack(spacing: 15) {
                                
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.red)
                                        .cornerRadius(6)
                                        .frame(width: 28, height: 28)
                                    Image(systemName: "trash.fill")
                                        .foregroundColor(.viewBg)
                                        .font(.system(size: 16))
                                }
                                Text("Reset progress")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                Spacer()
                                Button {
                                    //RESET
                                    challengeVM.reset()
                                } label: {
                                    ZStack(alignment: .center) {
                                        Rectangle()
                                            .frame(width: 68, height: 34)
                                            .foregroundColor(.gray.opacity(0.24))
                                            .font(.system(size: 17, weight: .bold))
                                            .cornerRadius(16)
                                        
                                        Text("Reset")
                                            .font(.system(size: 15))
                                            .foregroundColor(.white)
                                    }
                                }
                            }.padding()
                        }
                    }
                }
                
                Spacer()
            }.padding(.horizontal)
                .padding(.top)
        }
    }
}

#Preview {
    SettingsUIView(viewModel: SettingsViewModel(), challengeVM: ChallengeViewModel(), view: .constant(.settings))
}

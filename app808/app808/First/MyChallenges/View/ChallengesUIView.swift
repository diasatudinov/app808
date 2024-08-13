//
//  ChallengesUIView.swift
//  app808
//
//  Created by Dias Atudinov on 13.08.2024.
//

import SwiftUI

struct ChallengesUIView: View {
    @ObservedObject var viewModel: ChallengeViewModel
    @Binding var view: Views
    var body: some View {
        NavigationView {
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
                        
                        Text("My challenges")
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
                        VStack(spacing: 8) {
                            ForEach(viewModel.challenges, id:\.self) { challenge in
                                NavigationLink(destination: ChallengeDetails(viewModel: viewModel, challange: challenge)) {
                                    ChallengeCell(text: challenge.name, days: challenge.totalDays, daysFinish: challenge.finishedDays)
                                }
                                
//                                NavigationLink {
//                                    ChallengeDetails(viewModel: viewModel, challange: challenge)
//                                } label: {
//                                    ChallengeCell(text: challenge.name, days: challenge.totalDays, daysFinish: challenge.finishedDays)
//                                }
                                
                            }
                        }
                    }
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .frame(height: 54)
                                .foregroundColor(.mainBtn)
                                .font(.system(size: 17, weight: .bold))
                                .cornerRadius(16)
                            
                            HStack {
                                Image(systemName: "plus.circle")
                                Text("Add new challenge")
                            }.font(.system(size: 17)).foregroundColor(.white)
                            
                        }
                    }
                }.padding(.horizontal)
                    .padding(.top)
            }
        }
    }
}

#Preview {
    ChallengesUIView(viewModel: ChallengeViewModel(), view: .constant(.challenges))
}

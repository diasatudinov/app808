//
//  BadgesUIView.swift
//  app808
//
//  Created by Dias Atudinov on 12.08.2024.
//

import SwiftUI

struct BadgesUIView: View {
    @Binding var view: Views
    @ObservedObject var viewModel: BadgesViewModel
    @ObservedObject var challengeVM: ChallengeViewModel
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
                        
                        Text("Badges")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                        Spacer()
                        ZStack {
                            Rectangle()
                                .frame(width: 36, height: 36)
                                .foregroundColor(.clear)
                            
                        }
                    }
                    
                    HStack {
                        BadgesCell(imageName: challengeVM.completedChallengesCount > 0 ? viewModel.badges[0].imageName : viewModel.badges[0].imageNameOff, text: viewModel.badges[0].text, num: viewModel.badges[0].num)
                        BadgesCell(imageName: challengeVM.completedChallengesCount > 4 ? viewModel.badges[1].imageName : viewModel.badges[1].imageNameOff, text: viewModel.badges[1].text, num: viewModel.badges[1].num)
                    }
                    
                    HStack {
                        BadgesCell(imageName: challengeVM.completedChallengesCount > 9 ? viewModel.badges[2].imageName : viewModel.badges[2].imageNameOff, text: viewModel.badges[2].text, num: viewModel.badges[2].num)
                        BadgesCell(imageName: challengeVM.completedChallengesCount > 14 ? viewModel.badges[3].imageName : viewModel.badges[3].imageNameOff, text: viewModel.badges[3].text, num: viewModel.badges[3].num)
                    }
                    
                    HStack {
                        BadgesCell(imageName: challengeVM.completedChallengesCount > 19 ? viewModel.badges[4].imageName : viewModel.badges[4].imageNameOff, text: viewModel.badges[4].text, num: viewModel.badges[4].num)
                        BadgesCell(imageName: challengeVM.completedChallengesCount > 24 ? viewModel.badges[5].imageName : viewModel.badges[5].imageNameOff, text: viewModel.badges[5].text, num: viewModel.badges[5].num)
                    }
                    
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top)
            }
        }
    }
}

#Preview {
    BadgesUIView(view: .constant(.badges), viewModel: BadgesViewModel(), challengeVM: ChallengeViewModel())
}

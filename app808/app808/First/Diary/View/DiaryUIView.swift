//
//  DiaryUIView.swift
//  app808
//
//  Created by Dias Atudinov on 26.08.2024.
//

import SwiftUI

struct DiaryUIView: View {
    @ObservedObject var viewModel: DiaryViewModel
    @Binding var view: Views
    @State private var showAddNoteSheet = false
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
                        
                        Text("Diary")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                        Spacer()
                        ZStack {
                            Rectangle()
                                .frame(width: 36, height: 36)
                                .foregroundColor(.clear)
                            
                        }
                    }
                    
                    ZStack {
                        Color.cardBg.ignoresSafeArea()
                        VStack(spacing: 7) {
                            VStack {
                                Text("Record observations to improve your score. Clear planning is the key to achieving your goals!")
                                    .font(.system(size: 13))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white.opacity(0.7))
                            }.padding(.horizontal)
                        }
                        
                    }.cornerRadius(20)
                        .frame(height: 60)
                    
                    if viewModel.notes.isEmpty {
                        ZStack {
                            Color.cardBg.ignoresSafeArea()
                            VStack(spacing: 7) {
                                Image("emptyListLogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 160)
                                VStack {
                                    Text("Create a challenge")
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundColor(.white)
                                    Text("Your list of challenges is currently empty")
                                        .font(.system(size: 16))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white.opacity(0.7))
                                }
                            }
                            
                        }.cornerRadius(20)
                            .frame(height: 300)
                    } else {
                        ScrollView {
                            VStack(spacing: 8) {
                                ForEach(viewModel.notes, id:\.self) { challenge in
//                                    NavigationLink(destination: ChallengeDetails(viewModel: viewModel, challange: challenge)) {
//                                        ChallengeCell(text: challenge.name, days: challenge.totalDays, daysFinish: challenge.finishedDays)
//                                    }
                                    
                                }
                            }
                        }
                    }
                    Spacer()
                    Button {
                        showAddNoteSheet = true
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
                    .sheet(isPresented: $showAddNoteSheet) {
//                        NewChallengeUIView(viewModel: viewModel, showAddChallangeSheet: $showAddChallangeSheet)
                    }
            }
        }
    }
}


#Preview {
    DiaryUIView(viewModel: DiaryViewModel(), view: .constant(.diary))
}

//
//  NewChallengeUIView.swift
//  app808
//
//  Created by Dias Atudinov on 14.08.2024.
//

import SwiftUI

struct NewChallengeUIView: View {
    @State private var name = ""
    @State private var totalDays = 0
    @State private var level = 0
    @ObservedObject var viewModel: ChallengeViewModel
    @Binding var showAddChallangeSheet: Bool
    var body: some View {
        ZStack {
            Color.viewBg.ignoresSafeArea()
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: 36,height: 5)
                    .foregroundColor(.white.opacity(0.1))
                    .padding()
                
                Text("New challenge")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
                HStack {
                    Text("Your goal:")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom)
                ZStack {
                    Color.white.opacity(0.05)
                    HStack {
                        
                        if name.isEmpty {
                            Text("Enter the name of the challenge")
                                .foregroundColor(.white.opacity(0.3))
                        }
                        Spacer()
                    }.padding()
                    HStack() {
                        TextField("", text: $name)
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                         
                    }.padding()
                }.frame(height: 56)
                    .cornerRadius(16)
                    .padding(.bottom,52)
                
                // LEVEL
                VStack(spacing: 10) {
                    ZStack {
                        Color.white.opacity(0.05)
                        
                        HStack {
                            Text("Easy")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            
                            ZStack {
                                level == 1 ? Color.mainBtn : Color.white.opacity(0.05)
                                Text("10 days")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 74,height: 33).cornerRadius(6)
                        }.padding()
                        
                    }.frame(height: 57)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.mainBtn, lineWidth: level == 1 ? 2 : 0)
                        )
                        .onTapGesture {
                            level = 1
                            totalDays = 10
                        }
                    
                    ZStack {
                        Color.white.opacity(0.05)
                        
                        HStack {
                            Text("Medium")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            
                            ZStack {
                                level == 2 ? Color.mainBtn : Color.white.opacity(0.05)
                                Text("20 days")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 74,height: 33).cornerRadius(6)
                        }.padding()
                        
                    }.frame(height: 57)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.mainBtn, lineWidth: level == 2 ? 2 : 0)
                        )
                        .onTapGesture {
                            level = 2
                            totalDays = 20
                        }
                    
                    ZStack {
                        Color.white.opacity(0.05)
                        
                        HStack {
                            Text("Hard")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            
                            ZStack {
                                level == 3 ? Color.mainBtn : Color.white.opacity(0.05)
                                Text("30 days")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 74,height: 33).cornerRadius(6)
                        }.padding()
                        
                    }.frame(height: 57)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.mainBtn, lineWidth: level == 3 ? 2 : 0)
                        )
                        .onTapGesture {
                            level = 3
                            totalDays = 30
                        }
                    
                }
                Spacer()
                
                Button {
                    if !name.isEmpty && level != 0 {
                        print("Saved")
                        let challange = Challenge(name: name, totalDays: Double(totalDays), finishedDays: 1)
                        viewModel.addChallenge(for: challange)
                        showAddChallangeSheet = false
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(height: 54)
                            .foregroundColor(.mainBtn)
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(12)
                        
                        HStack {
                            Image(systemName: "checkmark")
                            Text("Save")
                        }.font(.system(size: 17)).foregroundColor(.white)
                        
                    }.opacity((!name.isEmpty && level != 0) ? 1 : 0.5)
                }
            }.padding(.horizontal)
        }
    }
}

#Preview {
    NewChallengeUIView(viewModel: ChallengeViewModel(), showAddChallangeSheet: .constant(true))
}

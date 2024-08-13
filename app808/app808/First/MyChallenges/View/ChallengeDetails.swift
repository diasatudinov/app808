//
//  ChallengeDetails.swift
//  app808
//
//  Created by Dias Atudinov on 13.08.2024.
//

import SwiftUI

struct ChallengeDetails: View {
    @ObservedObject var viewModel: ChallengeViewModel
    @Environment(\.presentationMode) var presentationMode
    var challange: Challenge
    let columns = Array(repeating: GridItem(.flexible()), count: 5)
    @State private var isEditing: Bool = false
    @State private var isFull: Bool = false
    
    @State private var editedDays: Double
    
    init(viewModel: ChallengeViewModel, challange: Challenge) {
        self.viewModel = viewModel
        self.challange = challange
        self._editedDays = State(initialValue: challange.finishedDays)
    }
    
    var body: some View {
        ZStack {
            Color.viewBg.ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
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
                    
                    Text("Challenge")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(width: 36, height: 36)
                            .foregroundColor(.clear)
                        
                    }
                }
                
                if isFull {
                    ChallengeDoneView(text: challange.name, days: challange.totalDays, daysFinish: editedDays)
                } else {
                    VStack {
                        Text("\(Int(editedDays))/\(Int(challange.totalDays))")
                            .font(.system(size: 52, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.top, 50)
                            .padding(.bottom, 28)
                        Text(challange.name)
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                        if !isEditing {
                            ProgressView(value: editedDays, total: challange.totalDays)
                                .progressViewStyle(LinearProgressViewStyle())
                                .accentColor(Color.mainBtn)
                                .scaleEffect(y: 3.2, anchor: .center)
                                .padding(.horizontal)
                                .padding(.top, 40)
                                .padding(.bottom, 32)
                        } else {
                            Slider(value: Binding(
                                get: { editedDays },
                                set: { editedDays = Double(Int($0)) }
                            ), in: 0...challange.totalDays, step: 1)
                        }
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(0..<Int(challange.totalDays), id: \.self) { index in
                                ZStack {
                                    Image("squareChallenge")
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.gray)
                                    
                                    if index < Int(editedDays) {
                                        Circle()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }.padding(.horizontal)
                        
                        
                        
                    }
                    
                }
                Spacer()
                if isFull {
                    Button {
                        viewModel.restartChallenge(for: challange)
                        isEditing = false
                        isFull = false
                    } label: {
                        if isFull {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(height: 54)
                                    .foregroundColor(.redBtn)
                                    .font(.system(size: 17, weight: .bold))
                                    .cornerRadius(16)
                                
                                HStack {
                                    Image(systemName: "arrow.circlepath")
                                    Text("Restart")
                                }.font(.system(size: 17)).foregroundColor(.white)
                                
                            }
                        }
                    }
                    
                } else {
                
                Button {
                    if !isEditing {
                        isEditing = true
                    } else {
                        if challange.totalDays == editedDays {
                            viewModel.finishChallenge(challange)
                            isFull = true
                        }
                        viewModel.editChallenge(for: challange, finishedDays: Double(editedDays))
                        isEditing = false
                    }
                    print(viewModel.challenges)
                } label: {
                
                        if isEditing {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(height: 54)
                                    .foregroundColor(.progress)
                                    .font(.system(size: 17, weight: .bold))
                                    .cornerRadius(16)
                                
                                HStack {
                                    Image(systemName: "checkmark")
                                    Text("Save")
                                }.font(.system(size: 17)).foregroundColor(.white)
                                
                            }
                        } else {
                            ZStack(alignment: .center) {
                                Rectangle()
                                    .frame(height: 54)
                                    .foregroundColor(.mainBtn)
                                    .font(.system(size: 17, weight: .bold))
                                    .cornerRadius(16)
                                
                                HStack {
                                    Image(systemName: "pencil.line")
                                    Text("Edit")
                                }.font(.system(size: 17)).foregroundColor(.white)
                                
                            }
                        }
                    }
                }
            }.padding(.horizontal)
                .padding(.top)
                .onAppear {
                    if challange.totalDays == editedDays {
                        isFull = true
                    }
                }
        }.navigationBarBackButtonHidden()
    }
    
}

#Preview {
    ChallengeDetails(viewModel: ChallengeViewModel(), challange: Challenge(name: "A month of morning exercises", totalDays: 30, finishedDays: 3))
}


struct ChallengeDoneView: View {
    var text: String
    var days: Double
    var daysFinish: Double
    var body: some View {
        VStack {
            ZStack {
                Image("finishedChalange1")
                Image("finishedChalange2")
                Image("finishedChalange4")
                Image("finishedChalange3")
                
            }
            
            Text("\(Int(daysFinish))/\(Int(days))")
                .font(.system(size: 52, weight: .bold))
                .foregroundColor(.white)
                .padding(.top, -40)
                .padding(.bottom)
            
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.white)
                
            ProgressView(value: daysFinish, total: days)
                .progressViewStyle(LinearProgressViewStyle())
                .accentColor(Color.mainBtn)
                .scaleEffect(y: 3.2, anchor: .center)
                .padding(.horizontal)
                .padding(.top, 40)
                .padding(.bottom, 32)
            Text("Congratulations! Your goal has been successfully completed!")
                .multilineTextAlignment(.center)
                .font(.system(size: 17))
                .foregroundColor(.white)
        }
    }
}

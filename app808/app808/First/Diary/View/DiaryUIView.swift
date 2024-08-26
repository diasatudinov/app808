//
//  DiaryUIView.swift
//  app808
//
//  Created by Dias Atudinov on 26.08.2024.
//

import SwiftUI

enum Tab {
    case notes, statistics
}

struct DiaryUIView: View {
    @ObservedObject var viewModel: DiaryViewModel
    @Binding var view: Views
    @State private var showAddNoteSheet = false
    @State private var selectedTab: Tab = .notes

    @ObservedObject var challangesVM: ChallengeViewModel
    
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
                        .padding(.top)
                    
                    Picker("Select a tab", selection: $selectedTab) {
                        Text("Notes").tag(Tab.notes)
                        Text("Statistics").tag(Tab.statistics)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onAppear {
                        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.gray
                        
                        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
                        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
                    }
                    
                    if selectedTab == .notes {
                        if viewModel.notes.isEmpty {
                            ZStack {
                                Color.cardBg.ignoresSafeArea()
                                VStack(spacing: 7) {
                                    Image("emptyListLogo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 160)
                                    VStack(spacing: 7) {
                                        Text("Create an entry")
                                            .font(.system(size: 22, weight: .bold))
                                            .foregroundColor(.white)
                                        Text("There are no records here")
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
                                    Text("Add a new entry")
                                }.font(.system(size: 17)).foregroundColor(.white)
                                
                            }
                        }
                    } else {
                        StatisticsView(daysNum: challangesVM.daysNum(), challengesNum: challangesVM.challengesNum(), complitedChallengesNum: Double(challangesVM.completedChallengesCount), achievementsNum: challangesVM.achievementsNum(), entriesNum: viewModel.notes.count)
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
    DiaryUIView(viewModel: DiaryViewModel(), view: .constant(.diary), challangesVM: ChallengeViewModel())
}


struct StatisticsView: View {
    @State private var progress: CGFloat = 1 // Example progress
    var daysNum: Int
    var challengesNum: Double
    var complitedChallengesNum: Double
    var achievementsNum: Int
    var entriesNum: Int
    
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            VStack(spacing: 7) {
                VStack(spacing: 5) {
                    Text("\(daysNum)")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    Text("days in the challenge")
                        .font(.system(size: 13, weight: .semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white.opacity(0.7))
                }.padding(.horizontal)
            }
            
        }.cornerRadius(20)
            .frame(height: 102)
        
        HStack {
            ZStack {
                Color.cardBg.ignoresSafeArea()
                VStack(spacing: 0) {
                    CircularProgressView(progress: complitedChallengesNum/challengesNum)
                    VStack(spacing: 1) {
                        Text("\(Int(complitedChallengesNum))/\(Int(challengesNum))")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                        Text("challenges completed")
                            .font(.system(size: 13, weight: .semibold))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white.opacity(0.7))
                    }.padding(.horizontal)
                }
                
            }.cornerRadius(20)
                .frame(height: 208)
            
            VStack(spacing: 4) {
                ZStack {
                    Color.cardBg.ignoresSafeArea()
                    VStack(spacing: 7) {
                        VStack(spacing: 5) {
                            Text("\(entriesNum)")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Text("entries added")
                                .font(.system(size: 13, weight: .semibold))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white.opacity(0.7))
                        }.padding(.horizontal)
                    }
                    
                }.cornerRadius(20)
                    .frame(height: 102)
                
                ZStack {
                    Color.cardBg.ignoresSafeArea()
                    VStack(spacing: 7) {
                        VStack(spacing: 5) {
                            Text("\(achievementsNum)")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(.white)
                            Text("achievements received")
                                .font(.system(size: 13, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white.opacity(0.7))
                        }.padding(.horizontal)
                    }
                    
                }.cornerRadius(20)
                    .frame(height: 102)
            }
            
        }
        
        Spacer()
    }
}


struct CircularProgressView: View {
    @State var progress: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 25)
                .opacity(0.2)
                .foregroundColor(Color.gray)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .butt, lineJoin: .miter))
                .foregroundColor(Color.statisticsCircle)
                .rotationEffect(Angle(degrees: 270)) // Start from top
            
        }
        .frame(width: 100, height: 100)
        .padding(11)
    }
}

//
//  BadgesUIView.swift
//  app808
//
//  Created by Dias Atudinov on 12.08.2024.
//

import SwiftUI

struct BadgesUIView: View {
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
                        BadgesCell(imageName: "award1", text: "First victory", num: 1)
                        BadgesCell(imageName: "award2", text: "Five steps to success", num: 5)
                    }
                    
                    HStack {
                        BadgesCell(imageName: "award3", text: "Middle of the road", num: 10)
                        BadgesCell(imageName: "award4", text: "Fifteenth milestone", num: 15)
                    }
                    
                    HStack {
                        BadgesCell(imageName: "award5", text: "Experienced Seeker", num: 20)
                        BadgesCell(imageName: "award6", text: "Conqueror of peaks", num: 25)
                    }
                    
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top)
            }
        }
    }
}

#Preview {
    BadgesUIView(view: .constant(.badges))
}

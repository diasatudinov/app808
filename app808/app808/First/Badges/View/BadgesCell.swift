//
//  BadgesCell.swift
//  app808
//
//  Created by Dias Atudinov on 12.08.2024.
//

import SwiftUI

struct BadgesCell: View {
    var imageName: String
    var text: String
    var num: Int
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .padding(.top)
                Text(text)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                NavigationLink {
                    BadgesDetails(imageName: imageName, text: text, num: num)
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(height: 34)
                            .foregroundColor(.gray.opacity(0.24))
                            .font(.system(size: 17, weight: .bold))
                            .cornerRadius(16)
                        
                        Text("Info")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }.frame(width: 55)
                }
                
                Spacer()
            }
            
        }.cornerRadius(20)
            .frame(height: 208)
    }
}

#Preview {
    BadgesCell(imageName: "award1", text: "First victory", num: 1)
}

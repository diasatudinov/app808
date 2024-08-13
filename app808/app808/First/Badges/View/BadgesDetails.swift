//
//  BadgesDetails.swift
//  app808
//
//  Created by Dias Atudinov on 12.08.2024.
//

import SwiftUI

struct BadgesDetails: View {
    var imageName: String
    var text: String
    var num: Int
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .padding(.top)
                Text(text)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom)
                Text("Exercise: complete \(num) challenge!")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.7))
               
                
                Spacer()
                
                ZStack(alignment: .center) {
                    Rectangle()
                        .frame(height: 54)
                        .foregroundColor(.mainBtn.opacity(imageName.contains("Off") ? 0.5 : 1))
                        .font(.system(size: 17, weight: .bold))
                        .cornerRadius(16)
                    if imageName.contains("Off") {
                        HStack {
                            Text("Done")
                        }.font(.system(size: 17)).foregroundColor(.white.opacity(0.5))
                    } else {
                        HStack {
                            Image(systemName: "checkmark")
                            Text("Executed by")
                        }.font(.system(size: 17)).foregroundColor(.white)
                    }
                    
                }.padding(.horizontal)
            }
            
        }.navigationTitle("Badge")
    }
}

#Preview {
    BadgesDetails(imageName: "awardOff1", text: "First victory", num: 1)
}

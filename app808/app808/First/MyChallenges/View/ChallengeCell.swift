//
//  ChallengeCell.swift
//  app808
//
//  Created by Dias Atudinov on 13.08.2024.
//

import SwiftUI

struct ChallengeCell: View {
    var text: String
    var days: Double
    var daysFinish: Double
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            
            VStack {
                Text(text)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                    ProgressView(value: Double(daysFinish), total: days)
                        .progressViewStyle(LinearProgressViewStyle())
                        .accentColor(Color.progress)
                        .scaleEffect(y: 3.2, anchor: .center)
                        .padding(.horizontal)
                        
                        
                
                
            }
            
        }.cornerRadius(20)
            .frame(height: 104)
    }
}

#Preview {
    ChallengeCell(text: "A month of morning exercises", days: 30, daysFinish: 20)
}

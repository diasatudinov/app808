//
//  NotesCellUIView.swift
//  app808
//
//  Created by Dias Atudinov on 27.08.2024.
//

import SwiftUI

struct NotesCellUIView: View {
    @State var emoji: String
    @State var title: String
    @State var description: String
    
    var body: some View {
        ZStack {
            Color.cardBg.ignoresSafeArea()
            VStack(spacing: 7) {
                HStack(spacing: 4) {
                    Text(emoji)
                        .font(.system(size: 17, weight: .semibold))
                    Text(title)
                        .font(.system(size: 17, weight: .semibold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    Spacer()
                }
                Text(description)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white.opacity(0.7))
            }.padding()
            
        }.cornerRadius(20)
            .frame(height: 124)
       
    }
}

#Preview {
    NotesCellUIView(emoji: "🤣", title: "Defining a goal and planning", description: "sdadsadadsadsadsdasdasda asdsadas dsadas dsa dasd asd asd asd as das das da d")
}

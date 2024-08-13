//
//  ContentView.swift
//  app808
//
//  Created by Dias Atudinov on 09.08.2024.
//

import SwiftUI

struct Challenge2: Identifiable {
    let id = UUID()
    var title: String
    var maxDays: Int
    var completedDays: Int
}

class ChallengeViewModel2: ObservableObject {
    @Published var challenges: [Challenge2] = [
        Challenge2(title: "30-Day Fitness", maxDays: 30, completedDays: 10),
        Challenge2(title: "Reading Challenge", maxDays: 15, completedDays: 7)
    ]
    
    func updateChallenge(_ challenge: Challenge2, completedDays: Int) {
        if let index = challenges.firstIndex(where: { $0.id == challenge.id }) {
            challenges[index].completedDays = completedDays
        }
    }
}


struct ContentView: View {
    @ObservedObject var viewModel = ChallengeViewModel2()
    
    var body: some View {
        NavigationView {
            List(viewModel.challenges) { challenge in
                NavigationLink(destination: ChallengeDetailView(challenge: challenge, viewModel: viewModel)) {
                    VStack(alignment: .leading) {
                        Text(challenge.title)
                            .font(.headline)
                        Text("Completed Days: \(challenge.completedDays)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Challenges")
        }
    }
}

#Preview {
    ContentView()
}


struct ChallengeDetailView: View {
    var challenge: Challenge2
    @ObservedObject var viewModel: ChallengeViewModel2
    
    @State private var editedDays: Int
    @State private var isEditing: Bool = false
    
    init(challenge: Challenge2, viewModel: ChallengeViewModel2) {
        self.challenge = challenge
        self.viewModel = viewModel
        self._editedDays = State(initialValue: challenge.completedDays)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(challenge.title)
                .font(.largeTitle)
            
            Text("Max Days: \(challenge.maxDays)")
            Text("Completed Days: \(challenge.completedDays)")
            
            if isEditing {
                Stepper("Completed Days: \(editedDays)", value: $editedDays, in: 0...challenge.maxDays)
            }
            
            Spacer()
            
            Button(action: {
                if isEditing {
                    viewModel.updateChallenge(challenge, completedDays: editedDays)
                }
                isEditing.toggle()
            }) {
                Text(isEditing ? "Save" : "Edit")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Challenge Details")
    }
}

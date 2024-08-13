//
//  ChallengeViewModel.swift
//  app808
//
//  Created by Dias Atudinov on 13.08.2024.
//

import Foundation

class ChallengeViewModel: ObservableObject {
    @Published var challenges: [Challenge] = [
        Challenge(name: "A month of morning exercises", totalDays: 30, finishedDays: 1),
        Challenge(name: "The goal: 30 days of running", totalDays: 30, finishedDays: 1)
    ] {
        didSet {
            saveChallenges()
        }
    }
    
    private let challengesFileName = "challenges.json"
    
    init() {
        loadChallenges()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func challengesFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(challengesFileName)
    }
    
    private func saveChallenges() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.challenges)
                try data.write(to: self.challengesFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadChallenges() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: challengesFilePath())
            challenges = try decoder.decode([Challenge].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    
    func addChallenge(for challenge: Challenge) {
        challenges.append(challenge)
    }
    
    func deleteChallenge(for challenge: Challenge) {
        if let index = challenges.firstIndex(where: { $0.id == challenge.id }) {
            challenges.remove(at: index)
        }
    }
    
    func editChallenge(for challenge: Challenge, finishedDays: Double) {
        if let index = challenges.firstIndex(where: { $0.id == challenge.id }) {
            challenges[index].finishedDays = finishedDays
        }
    }
    
    func updateChallenge(_ challenge: Challenge, completedDays: Double) {
        if let index = challenges.firstIndex(where: { $0.id == challenge.id }) {
            challenges[index].finishedDays = completedDays
        }
    }
    
    func restartChallenge(for challenge: Challenge) {
        if let index = challenges.firstIndex(where: { $0.id == challenge.id }) {
            challenges[index].finishedDays = 1
        }
    }
    
}


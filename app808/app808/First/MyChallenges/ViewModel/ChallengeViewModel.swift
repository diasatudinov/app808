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
    
    func daysNum() -> Int {
        var sum = 0
        challenges.forEach { challenge in
            sum += Int(challenge.totalDays)
        }
        return sum
    }
    
    func challengesNum() -> Double {
        Double(challenges.count)
    }
    
    func complitedChallengesNum() -> Double {
        var num = 0
        challenges.forEach { challenge in
            if challenge.isDone {
                num += 1
            }
        }
        return Double(num)
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
            challenges[index].isDone = false
        }
    }
    
    func finishChallenge(_ challenge: Challenge) {
        if let index = challenges.firstIndex(where: { $0.id == challenge.id }) {
            challenges[index].isDone = true
        }
    }
    
    var completedChallengesCount: Int {
        challenges.filter { $0.isDone == true }.count
    }
    
    func achievementsNum() -> Int {
        var challangesNum = challenges.filter { $0.isDone == true }.count
        if challenges.filter({ $0.isDone == true }).count > 0 && challenges.filter({ $0.isDone == true }).count < 5{
            return 1
        } else if challenges.filter({ $0.isDone == true }).count > 4 && challenges.filter({ $0.isDone == true }).count < 10{
            return 2
        } else if challenges.filter({ $0.isDone == true }).count > 9 && challenges.filter({ $0.isDone == true }).count < 15{
            return 3
        } else if challenges.filter({ $0.isDone == true }).count > 14 && challenges.filter({ $0.isDone == true }).count < 20{
            return 4
        } else if challenges.filter({ $0.isDone == true }).count > 19 && challenges.filter({ $0.isDone == true }).count < 25{
            return 5
        } else if challenges.filter({ $0.isDone == true }).count > 24 && challenges.filter({ $0.isDone == true }).count < 30{
            return 6
        }
        return 0
        
    }
    
    func reset() {
        for index in 0...challenges.count - 1 {
            challenges[index].finishedDays = 1
            challenges[index].isDone = false
        }
    }
    
}


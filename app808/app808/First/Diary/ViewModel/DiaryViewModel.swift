//
//  DiaryViewModel.swift
//  app808
//
//  Created by Dias Atudinov on 26.08.2024.
//

import Foundation

class DiaryViewModel: ObservableObject {
   
    @Published var notes: [Diary] = [ ] {
        didSet {
            saveChallenges()
        }
    }
    private let challengesFileName = "notes.json"
    
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
                let data = try encoder.encode(self.notes)
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
            notes = try decoder.decode([Diary].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    func addNote(for note: Diary) {
        notes.append(note)
    }
    
    func deleteNote(for note: Diary) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes.remove(at: index)
        }
    }
    
    func updateNote(for note: Diary, newEmoji: String, newTitle: String, newDescription: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].title = newTitle
            notes[index].description = newDescription
            notes[index].emoji = newEmoji
        }
    }
}

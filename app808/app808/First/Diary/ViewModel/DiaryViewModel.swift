//
//  DiaryViewModel.swift
//  app808
//
//  Created by Dias Atudinov on 26.08.2024.
//

import Foundation

class DiaryViewModel: ObservableObject {
   
    @Published var notes: [Diary] = [
        Diary(emoji: "🥶", title: "Defining a goal and planning", description: "To achieve any goal, it is necessary to clearly formulate exactly what you want to achieve. The planning process includes: A description of the goal in a clear and specific for . Setting deadlines for achieving a goal (for example, in a month, six months, or a year). Dividing the overall goal into smaller steps or stages. Determining the resources needed to achieve the goal (financial, temporary, human). Create a schedule for each step. Assessment of possible obstacles and development of ways to overcome them."),
        Diary(emoji: "🤩", title: "Defining a goal and planning", description: "To achieve any goal, it is necessary to clearly formulate exactly what you want to achieve. The planning process includes: A description of the goal in a clear and specific for . Setting deadlines for achieving a goal (for example, in a month, six months, or a year). Dividing the overall goal into smaller steps or stages. Determining the resources needed to achieve the goal (financial, temporary, human). Create a schedule for each step. Assessment of possible obstacles and development of ways to overcome them."),
        Diary(emoji: "🤩", title: "Defining a goal and planning", description: "To achieve any goal, it is necessary to clearly formulate exactly what you want to achieve. The planning process includes: A description of the goal in a clear and specific for . Setting deadlines for achieving a goal (for example, in a month, six months, or a year). Dividing the overall goal into smaller steps or stages. Determining the resources needed to achieve the goal (financial, temporary, human). Create a schedule for each step. Assessment of possible obstacles and development of ways to overcome them.")
    ]
    
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

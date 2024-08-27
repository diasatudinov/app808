//
//  Diary.swift
//  app808
//
//  Created by Dias Atudinov on 26.08.2024.
//

import Foundation

struct Diary: Identifiable, Hashable, Codable {
    var id = UUID()
    var emoji: String
    var title: String
    var description: String
}

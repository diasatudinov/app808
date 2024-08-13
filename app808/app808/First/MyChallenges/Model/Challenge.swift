//
//  Challenge.swift
//  app808
//
//  Created by Dias Atudinov on 13.08.2024.
//

import Foundation

struct Challenge: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var totalDays: Double
    var finishedDays: Double
    
    enum CodingKeys: String, CodingKey {
        case id, name, totalDays, finishedDays
    }
}


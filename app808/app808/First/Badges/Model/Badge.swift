//
//  Badge.swift
//  app808
//
//  Created by Dias Atudinov on 13.08.2024.
//

import Foundation

struct Badge: Identifiable, Hashable, Codable {
    var id = UUID()
    var imageName: String
    var imageNameOff: String
    var text: String
    var num: Int
    
    enum CodingKeys: String, CodingKey {
        case id, imageName, imageNameOff, text, num
    }
}

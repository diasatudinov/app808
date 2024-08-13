//
//  BadgesViewModel.swift
//  app808
//
//  Created by Dias Atudinov on 13.08.2024.
//

import Foundation

class BadgesViewModel: ObservableObject {
    @Published var badges: [Badge] = [
        Badge(imageName: "award1", imageNameOff: "awardOff1", text: "First victory", num: 1),
        Badge(imageName: "award2", imageNameOff: "awardOff2", text: "Five steps to success", num: 5),
    
        Badge(imageName: "award3", imageNameOff: "awardOff3", text: "Middle of the road", num: 10),
        Badge(imageName: "award4", imageNameOff: "awardOff4", text: "Fifteenth milestone", num: 15),
    
        Badge(imageName: "award5", imageNameOff: "awardOff5", text: "Experienced Seeker", num: 20),
        Badge(imageName: "award6", imageNameOff: "awardOff6", text: "Conqueror of peaks", num: 25)
        ]
    
    
}

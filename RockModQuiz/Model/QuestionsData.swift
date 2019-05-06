//
//  QuestionsData.swift
//  RockModQuiz
//
//  Created by Ruslan Safin on 06/05/2019.
//  Copyright © 2019 Ruslan Safin. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: HumanType
}

enum HumanType: String {
    case rocker = "Rocker", mid = "Mid", fogey = "Fogey"
    
    var definition: String {
        switch self {
        case .rocker:
            return "Well done! You certainly DO rock! Keep it up, my advice, never, EVER, get into Dance music!"
        case .mid:
            return "Ok, either you are really dumb, or you don't know a thing about rock. If you think you're a rocker, you need help!"
        case .fogey:
            return "Hey, you need to lighten up on your rocking mind! Don't worry, you'll get there eventually."
        }
    }
}

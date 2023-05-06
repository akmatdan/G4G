//
//  EventsQuestions.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/4/23.
//

import Foundation

struct EventsQuestions: Codable {
    let id: Int
    let event: Int
    let questionType: String
    let choices: [String: String]?
    let questionText: String
}


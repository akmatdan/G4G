//
//  Question.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 29/3/23.
//

import Foundation

struct Question: Identifiable {
    let id: Int
    let title: String
    let options: [String]
    let correctIndex: Int
    var attempted: Bool?
    var answeredCorrectly: Bool?
    var explanation: String
    
    var hasAnswered: Bool {
        attempted != nil
    }
    
    var isCorrect: Bool? {
        guard let attempted = attempted else { return nil }
        return attempted && (correctIndex == selectedAnswerIndex)
    }
    
    var selectedAnswerIndex: Int? {
        guard let attempted = attempted, attempted else { return nil }
        return options.firstIndex(of: selectedAnswer!)
    }
    
    var selectedAnswer: String? {
        didSet {
            attempted = true
        }
    }
    
    init(id: Int, title: String, options: [String], correctIndex: Int, explanation: String) {
        self.id = id
        self.title = title
        self.options = options
        self.correctIndex = correctIndex
        self.explanation = explanation
    }
}

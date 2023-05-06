//
//  Event.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 27/3/23.
//

import Foundation

struct Event: Codable {
    
    let id: Int
    let attendees: [Int]
    let event, name, speaker, description: String
    let start_date, end_date: String
    let location: String
    let image: String
    let capacity: Int
    let created_date: String
    let is_active: Bool
    let status: String
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
        
    var formattedStartDate: String? {
        let date = Event.dateFormatter.date(from: start_date)
        Event.dateFormatter.dateFormat = "dd.MM.yyyy"
        return date.flatMap { Event.dateFormatter.string(from: $0) }
    }
}

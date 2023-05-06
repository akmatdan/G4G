//
//  Forum.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 19/4/23.
//

import Foundation

struct Forum: Codable {
    let id: Int
    let event, name, description: String
    let start_date, end_date, created_date: String
    let image: String
    let is_active: Bool
    let city, location: String
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
        
    var formattedStartDate: String? {
        let date = Forum.dateFormatter.date(from: start_date)
        Forum.dateFormatter.dateFormat = "dd.MM.yyyy"
        return date.flatMap { Forum.dateFormatter.string(from: $0) }
    }
}

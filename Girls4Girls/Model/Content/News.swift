//
//  News.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 13/4/23.
//

import Foundation

struct News: Codable {
    let id: Int
    let title: String
    let poster: String
    let content: String
    let created_date: String
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
        
    var formattedStartDate: String? {
        let date = News.dateFormatter.date(from: created_date)
        News.dateFormatter.dateFormat = "dd.MM.yyyy"
        return date.flatMap { News.dateFormatter.string(from: $0) }
    }
}



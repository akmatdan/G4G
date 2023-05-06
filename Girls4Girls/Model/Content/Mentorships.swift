//
//  Mentorships.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/4/23.
//

import Foundation

struct Mentorships: Codable, Identifiable {
    let id: Int
    let event: String
    let start_date, end_date: String
    let image, created_date: String
    let is_active: Bool
    let name, city, description, location: String
    
    var remainingDays: Int? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            guard let startDate = dateFormatter.date(from: start_date) else { return nil }
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day], from: Date(), to: startDate)
            return components.day
        }
}

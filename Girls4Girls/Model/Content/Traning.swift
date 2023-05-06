//
//  Traning.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 19/4/23.
//

import Foundation

struct Traning: Codable {
    let id: Int
    let event, name, description: String
    let start_date, end_date, created_date: String
    let location, city: String
    let image: String
    let is_active: Bool
}

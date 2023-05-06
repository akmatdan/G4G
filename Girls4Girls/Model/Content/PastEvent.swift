//
//  PastEvent.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 16/4/23.
//

import Foundation

struct PastEvents: Codable {
    let id: Int
    let event, title, content, created_date: String
    let pictures: [Picture]
}

struct Picture: Codable {
    let id: Int
    let image: String
}

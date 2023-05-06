//
//  Videos.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 19/4/23.
//

import Foundation

struct Videos: Codable {
    let id: Int
    let url: String
    let categories: [Category]
    let title: String
    let speaker: String
    let description: String
}

struct Category: Codable {
    let id: Int
    let name: String
}

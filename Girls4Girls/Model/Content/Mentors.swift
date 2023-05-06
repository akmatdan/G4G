//
//  Mentors.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 13/4/23.
//

import Foundation

struct Mentor: Codable {
    let id: Int
    let name, job, picture, description: String
    let instagram, linkedin: String
    let createdDate: String

    enum CodingKeys: String, CodingKey {
        case id, name, job, picture, description, instagram, linkedin
        case createdDate = "created_date"
    }
}

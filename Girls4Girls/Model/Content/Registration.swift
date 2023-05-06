//
//  Registration.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 22/4/23.
//

import Foundation

struct Registration: Codable {
    let event: Int
    let user: Int
    let userEmail: String
    let name: String
    let email: String
    let phone: String
    let dateOfBirth: String
    let region: String
    let city: String
    let resume: String?
    let createdDate: String
    let status: String
    let answers: [String: String]
    let questions: [String]
}

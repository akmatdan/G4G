//
//  User.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/4/23.
//

import Foundation

struct User: Decodable {
    let id: Int
    let email: String
    let region: String
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let age: Int
    let phoneNumber: String
    let gender: String
    let profilePicture: String
    
    private enum CodingKeys: String, CodingKey {
        case id, email, region
        case firstName = "first_name"
        case lastName = "last_name"
        case dateOfBirth = "date_of_birth"
        case age, phoneNumber, gender
        case profilePicture = "profile_picture"
    }
}

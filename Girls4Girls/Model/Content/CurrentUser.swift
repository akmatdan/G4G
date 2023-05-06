//
//  CurrentUser.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 22/4/23.
//

import Foundation

struct CurrentUser: Decodable {
    let id: String
    let email: String
    let region: String
    let first_name: String
    let last_name: String
    let date_of_birth: String
    let age: Int
    let phone_number: String
    let gender: String
    let profile_picture: String
}

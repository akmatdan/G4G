//
//  DropdownField.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 25/2/23.
//

import SwiftUI

struct DropdownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension DropdownMenuOption {
    static let testSingleName: DropdownMenuOption = DropdownMenuOption(option: "Tom")
    static let testAllNames: [DropdownMenuOption] = [
            DropdownMenuOption(option: "Бишкек"),
            DropdownMenuOption(option: "Чуй"),
            DropdownMenuOption(option: "Иссык-Куль"),
            DropdownMenuOption(option: "Нарын"),
            DropdownMenuOption(option: "Талас"),
            DropdownMenuOption(option: "Жалал-Абад"),
            DropdownMenuOption(option: "Ош"),
            DropdownMenuOption(option: "Баткен")
        ]
    
    static let sex: DropdownMenuOption = DropdownMenuOption(option: "Ж")
    static let sexOption: [DropdownMenuOption] = [
            DropdownMenuOption(option: "М"),
            DropdownMenuOption(option: "Ж"),
            ]
}
    

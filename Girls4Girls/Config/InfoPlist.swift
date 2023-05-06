//
//  InfoPlist.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 12/3/23.
//

import Foundation

public enum InfoPlist {
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let rootHost: String = {
        guard let rootURLstring = Self.infoDictionary["ROOT_HOST"] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        return rootURLstring
    }()
}

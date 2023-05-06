//
//  Utils.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 22/3/23.
//

import Foundation

class Utils {
    
    static func isValidEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // short format
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    static func localizedString(string: String) -> String {
        return String(format: NSLocalizedString(string, comment: ""))
    }
    
    static func getAppVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
}


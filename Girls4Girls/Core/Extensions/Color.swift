//
//  Color.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 20/2/23.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
    let darkGray = Color("darkGray")
    
    let blue = Color("BlueColor")
    let pink = Color("PinkColor")
    let purple = Color("PurpleColor")
    let title = Color("TitleColor")
    let darkPurple = Color("darkPurple")
    let greenLight = Color("GreenLight")
    
    let gradientPurple = Color("GradientPurple")
    let gradientBlue = Color("GradientBlue")
    let gradientPink = Color("GradientPink")
    
    let correct = Color("correct")
    let incorrect = Color("incorrect")
}

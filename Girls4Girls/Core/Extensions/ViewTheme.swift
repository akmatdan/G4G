//
//  ViewTheme.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 19/4/23.
//

import SwiftUI

extension View {
    func themeGradient() -> some View {
        ZStack {
            LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.7)
                .ignoresSafeArea()
            self // The original view is added on top of the gradient
        }
    }
}

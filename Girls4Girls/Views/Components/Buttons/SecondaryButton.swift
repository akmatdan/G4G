//
//  SecondaryButton.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/2/23.
//

import SwiftUI

struct SecondaryButton<Content: View>: View {
    
    var content: Content
    var text: String
    var navTitle: String
    
    var body: some View {
        NavigationLink {
            content
        } label: {
            Text(text)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
        }
    }
}

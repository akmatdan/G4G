//
//  PrimaryButton.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI

struct PrimaryButton<Content: View>: View {
    
    var content: Content
    var text: String
    var navTitle: String
    @State private var isDetailActive = false
    
    var body: some View {
        
        NavigationLink {
            content
                .navigationBarTitle(navTitle, displayMode: .inline)
        } label: {
            HStack {
                Text(text)
                    .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    
            }
        }
        .background(Color.theme.purple)
        .cornerRadius(10)
        .padding(.vertical, 20)
    }
}


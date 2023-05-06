//
//  WhiteButton.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 14/3/23.
//

import SwiftUI

struct WhiteButton<Content: View>: View {
    
    var content: Content
    var text: String
    var navTitle: String
    @State private var isDetailActive = false
    
    var body: some View {
        Spacer()
        
        NavigationLink {
            content
                .navigationBarTitle(navTitle, displayMode: .inline)
        } label: {
            HStack {
                Text(text)
                    .fontWeight(.semibold)
                    .font(.title3)
                    .foregroundColor(Color.theme.darkPurple)
                    .padding()
                    .frame(maxWidth: .infinity)
                    
            }
        }
        .background(.white)
        .cornerRadius(10)
        .padding(.vertical, 20)
    }
}


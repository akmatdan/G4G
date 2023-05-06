//
//  PrimaryButtonForm.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 24/2/23.
//

import SwiftUI

struct PrimaryButtonForm<Content: View>: View {
    
    var content: Content
    var text: String
    
    var body: some View {
        Spacer()
        VStack {
            NavigationLink(destination: content,
                           label: {
                HStack {
                    Text(text)
                        .fontWeight(.semibold)
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .background(Color.theme.purple)
                .cornerRadius(10)
                .padding(.vertical, 20)
                .padding(.horizontal)
            }).isDetailLink(false)
        }
        
        NavigationLink {
            content
        } label: {
            
        }
        .background(Color.theme.purple)
        .cornerRadius(10)
        .padding(.vertical, 20)
        .padding(.horizontal)
    }
}


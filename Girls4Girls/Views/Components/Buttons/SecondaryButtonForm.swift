//
//  SecondaryButtonForm.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 6/4/23.
//

import SwiftUI

struct SecondaryButtonForm<Content:View> : View {
    
    var content: Content
    var text: String
    
    
    var body: some View {
        NavigationLink {
            content
        } label: {
            Text(text)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .foregroundColor(.theme.purple)
                .padding()
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.theme.purple, lineWidth: 1)
                )
                .padding(.horizontal, 30)
        }
    }
}

//struct SecondaryButtonForm_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondaryButtonForm()
//    }
//}

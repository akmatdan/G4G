//
//  SecondaryButton1.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 19/4/23.
//

import SwiftUI

struct SecondaryButton1<Content: View>: View {
    
    var content: Content
    var text: String
    
    var body: some View {
        NavigationLink {
            content
                .navigationBarHidden(true)
        } label: {
            Text(text)
                .font(.custom(FontsManager.Mulish.semiBold, size: 18))
                .foregroundColor(.black)
                .padding()
                .frame(width: 150)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("PurpleColor"), lineWidth: 3)
                )
        }
    }
}


struct SecondaryButton1_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton1(content: EmptyView(), text: "text")
    }
}

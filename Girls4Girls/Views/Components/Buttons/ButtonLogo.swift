//
//  ButtonLogo.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 22/2/23.
//

import SwiftUI

struct ButtonLogo<Content: View>: View {
    var content: Content
    var img: String
    var text: String
    var body: some View {
        NavigationLink {
            content
                .navigationBarHidden(true)
        } label: {
            HStack {
                Image(img)
                    .resizable()
                    .frame(width: 10, height: 19)
                    .padding(20)
                
                Text(text)
                    .fontWeight(.semibold)
                    .font(.title3)
                    .foregroundColor(Color.theme.purple)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                
                Text("")
                    .padding(20)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.theme.purple, lineWidth: 1)
            )
        }
    }
}

struct ButtonLogo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLogo(content: MainView(), img: "facebook_logo", text: "Facebook")
    }
}

//
//  TextFieldForm.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 22/2/23.
//

import SwiftUI

struct TextFieldForm: View {
    
    @State private var isShowingText = false

    var text: String
    var bind: Binding<String>
    var promt: String

    var body: some View {
        Spacer()
        TextField(text, text: bind)
            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.theme.purple, lineWidth: 1)
            )
            .padding()
            .onTapGesture {
                isShowingText = true
            }
        
        if isShowingText {
            Text(promt)
                .font(.custom(FontsManager.Mulish.semiBold, size: 14))
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
                .foregroundColor(.red)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct TextFieldForm2: View {
    
    @State private var isShowingText = false

    var text: String
    var bind: Binding<String>
    var promt: String

    var body: some View {
        Spacer()
        TextField(text, text: bind)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .foregroundColor(Color.theme.darkPurple)
            .padding()
            .background(.white)
            .cornerRadius(10)
            .onTapGesture {
                isShowingText = true
            }
        
        if isShowingText {
            Text(promt)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
                .foregroundColor(.red)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

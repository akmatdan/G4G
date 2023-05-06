//
//  TextFieldFormSignUp.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/2/23.
//

import SwiftUI

struct TextFieldFormSignUp: View {
    
    var text: String
    var bind: Binding<String>
    var promt: String
    @State private var isShowingText = false
    
    var body: some View {
        Spacer()
        VStack(alignment: .leading) {
            Section(header:
                        Text(text)
                            .font(.custom(FontsManager.Mulish.regular, size: 16))
                            .frame(maxWidth: .infinity, alignment: .leading)
            ) {
                TextField("", text: bind)
                    .font(.custom(FontsManager.Mulish.regular, size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.theme.purple, lineWidth: 1)
                    )
                    .onTapGesture {
                        isShowingText = true
                    }
            }
            if isShowingText {
                Text(promt)
                    .font(.custom(FontsManager.Mulish.regular, size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.red)
                    .padding(.horizontal, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct TextFieldFormSignUp2: View {
    
    var text: String
    var bind: Binding<String>
    var promt: String
    @State private var isShowingText = false
    
    var body: some View {
        Spacer()
        VStack(alignment: .leading) {
            Section(header: Text(text)) {
                TextField("", text: bind)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .foregroundColor(Color.theme.darkPurple)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.top, 5)
                    .onTapGesture {
                        isShowingText = true
                    }
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
}

//
//  PasswordFieldRegister.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/2/23.
//

import SwiftUI

struct PasswordFieldRegister: View {
    
    @ObservedObject var loginData = UserStateViewModel()
    @State private var isShowingText = false
    
    var text: String
    var promt: String
    var bind: Binding<String>
    
    
    var body: some View {
        Spacer()
        Section(header:
                    Text(text)
            .font(.custom(FontsManager.Mulish.regular, size: 16))
            .frame(maxWidth: .infinity, alignment: .leading)
        ) {
            HStack {
                VStack {
                    if loginData.showConfirmPassword {
                        TextField(text, text: bind)
                            .font(.custom(FontsManager.Mulish.regular, size: 16))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .onTapGesture {
                                isShowingText = true
                            }
                    }
                    else {
                        SecureField(text, text: bind)
                            .font(.custom(FontsManager.Mulish.regular, size: 16))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .onTapGesture {
                                isShowingText = true
                            }
                    }
                }
                Button {
                    loginData.showConfirmPassword.toggle()
                } label: {
                    Image(loginData.showConfirmPassword ? "eyeSlash" : "eye")
                        .foregroundColor(Color.gray)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.theme.purple, lineWidth: 1)
            )
            
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

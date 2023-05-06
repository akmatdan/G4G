//
//  PasswordForm.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 22/2/23.
//

import SwiftUI

struct PasswordForm: View {
    
    @State var visible = false
    @State private var isShowingText = false
    
    var text: String
    var bind: Binding<String>
    var promt: String
    
    var body: some View {
        Spacer()
        VStack {
            HStack {
                VStack {
                    if self.visible {
                        TextField(text, text: bind)
                            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .onTapGesture {
                                isShowingText = true
                            }
                    }
                    else {
                        SecureField(text, text: bind)
                            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .onTapGesture {
                                isShowingText = true
                            }
                    }
                    
                }
                
                Button {
                    self.visible.toggle()
                } label: {
                    Image(self.visible ? "eyeSlash" : "eye")
                        .foregroundColor(Color.theme.purple)
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.theme.purple, lineWidth: 1)
            )
            .padding()
            .disableAutocorrection(true)
            .autocapitalization(.none)
            
            if isShowingText {
                Text(promt)
                    .font(.custom(FontsManager.Mulish.semiBold, size: 14))
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.red)
                    .padding(.horizontal, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
    }
}


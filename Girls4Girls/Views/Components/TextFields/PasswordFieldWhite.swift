//
//  PasswordFieldWhite.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 4/4/23.
//

import SwiftUI

struct PasswordFieldWhite: View {
    
    @State var visible = false
    @State private var isShowingText = false
    
    var header: String
    var text: String
    var bind: Binding<String>
    var promt: String
    
    var body: some View {
        
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.theme.purple, lineWidth: 5)
                        .frame(width: 350, height: 70)
                        .background(.white)
                        .cornerRadius(10)
                    
                    VStack {
                        HStack {
                            VStack {
                                Text(header)
                                    .font(.custom(FontsManager.Mulish.black, size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .frame(width: 270, alignment: .leading)
                                
                                if self.visible {
                                    
                                    TextField(text, text: bind)
                                        .font(.custom(FontsManager.Mulish.black, size: 16))
                                        .disableAutocorrection(true)
                                        .frame(width: 260)
                                        .autocapitalization(.none)
                                        .onTapGesture {
                                            isShowingText = true
                                        }
                                }
                                else {
                                    SecureField(text, text: bind)
                                        .font(.custom(FontsManager.Mulish.black, size: 16))
                                        .disableAutocorrection(true)
                                        .frame(width: 260)
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
                        
//                        if isShowingText {
//                            Text(promt)
//                                .fixedSize(horizontal: false, vertical: true)
//                                .font(.caption)
//                                .foregroundColor(.red)
//                                .padding(.horizontal, 15)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                        }
                    }
                }
            }
    }
}

struct PasswordFieldWhite_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFieldWhite(visible: false, header: "Password", text: "password", bind: .constant(""), promt: "")
    }
}

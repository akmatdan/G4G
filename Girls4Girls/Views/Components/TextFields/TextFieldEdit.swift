//
//  TextFieldEdit.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 4/4/23.
//

import SwiftUI

struct TextFieldEdit: View {
    
    var text: String
    var placeholder: String
    var bind: Binding<String>
    var promt: String
    
    @State private var isShowingText = false
    
    var body: some View {
        Spacer()
        VStack(alignment: .leading) {
            Section {
                ZStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.theme.purple, lineWidth: 5)
                            .frame(width: 350, height: 70)
                            .background(.white)
                            .cornerRadius(10)
                    }
                        
                    VStack {
                        Text(text)
                            .font(.custom(FontsManager.Mulish.black, size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                            .frame(width: 300, alignment: .leading)
                        
                        TextField(placeholder, text: bind)
                            .font(.custom(FontsManager.Mulish.black, size: 16))
                            .foregroundColor(.black)
                            .disableAutocorrection(true)
                            .frame(width: 300, alignment: .leading)
                            .foregroundColor(Color.theme.darkPurple)
                            .onTapGesture {
                                isShowingText = true
                            }
                    }
                }   
            }
        }
    }
}

struct TextFieldEdit_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldEdit(text: "some text", placeholder: "", bind: .constant("asdf"), promt: "mnbvcs")
    }
}

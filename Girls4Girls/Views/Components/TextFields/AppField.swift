//
//  AppField.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 10/4/23.
//

import SwiftUI

struct AppField: View {

    var text: String
    var bind: Binding<String>
    var placeholder: String
    
    @StateObject var loginData: UserStateViewModel = UserStateViewModel()

    var body: some View {
        VStack {
            Text(text)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 15)
                .padding(.top, 5)
            
            TextField(placeholder, text: bind)
                .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .disableAutocorrection(true)
                .padding(15)
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal, 15)
                .padding(.bottom, 5)
        }
        .padding(.horizontal, 10)
    }
}

struct AppField_Previews: PreviewProvider {
    static var previews: some View {
        AppField(text: "asdf", bind: .constant(""), placeholder: "adf")
    }
}

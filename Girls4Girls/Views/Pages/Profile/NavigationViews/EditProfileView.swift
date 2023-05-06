//
//  EditProfileView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 28/3/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var loginData: UserStateViewModel = UserStateViewModel()
    @State var sex: DropdownMenuOption? = nil
    @State var region: DropdownMenuOption? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    ZStack {
                        Image("backNav")
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image("back")
                            }
                            Spacer()
                            Text("Редактировать профиль")
                                .frame(width: UIScreen.main.bounds.height * (1/4))
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.leading, 20)
                            Spacer()
                            Spacer()
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        Image("profileImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 110, height: 110)
                        
                        Image("addPI")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .offset(x: 40, y: 40)
                    }
                    .padding(.vertical, 15)
                }
                
                VStack {
                    ScrollView {
                        TextFieldEdit(text: "Имя", placeholder: "Team6", bind: $loginData.first_name, promt: loginData.first_name)
                        
                        TextFieldEdit(text: "Фамилия", placeholder: "Neobis", bind: $loginData.last_name, promt: loginData.last_name)
                        
                        TextFieldEdit(text: "Электронная почты", placeholder: "teamneobis@gmail.com", bind: $loginData.email, promt: loginData.emailPrompt)
                        
                        DropdownWhite(selectedOptions: self.$sex, text: "Пол", placeholder: "М", bind: loginData.gender ?? "", options: DropdownMenuOption.sexOption)
                        
                        DropdownWhite(selectedOptions: self.$region, text: "Регион", placeholder: "Бишкек", bind: loginData.region ?? "", options: DropdownMenuOption.testAllNames)
                        
                        PasswordFieldWhite(header: "Пароль", text: "", bind: $loginData.password, promt: loginData.passwordPrompt)
                        
                        PrimaryButton(content: EmptyView(), text: "Сохранить", navTitle: "")
                            .padding(.horizontal, 15)
                    }
                    
                }
                .padding(.horizontal, 15)
                
                Spacer()
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

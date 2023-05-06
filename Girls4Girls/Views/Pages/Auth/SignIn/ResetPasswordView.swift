//
//  ResetPasswordView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/4/23.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @Binding var isResetPassword: Bool
    @StateObject private var loginData = UserStateViewModel()
    @State private var errorMessage: String = ""
    @State private var isConfirm = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Введите email, вы получите письмо с сылкой на восстановление пароля.")
                    .font(.custom(FontsManager.Mulish.bold, size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                TextFieldForm(text: "email", bind: $loginData.email, promt: loginData.emailPrompt)
                
                Button {
                    loginData.reset()
                    isConfirm = true
                } label: {
                    Text("Отправить")
                        .font(.custom(FontsManager.Mulish.bold, size: 18))
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.theme.purple)
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
                .alert(isPresented: $isConfirm) {
                    Alert(title: Text("Мы отправили email на вашу почту."), message: Text("Пожалуйста проверьте ваш email."), dismissButton: .default(Text("Закрыть")))
                }
            }
            
            .navigationBarItems(trailing: Button("Закрыть") {
                isResetPassword = false
            })
        }
        .alert(isPresented: .constant(!errorMessage.isEmpty)) {
            Alert(title: Text("Ошибка"), message: Text(errorMessage), dismissButton: .default(Text("OK")) {
                errorMessage = "Извините ошибка, временно функция не доступна"
            })
        }
    }
}


struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView(isResetPassword: .constant(false))
    }
}

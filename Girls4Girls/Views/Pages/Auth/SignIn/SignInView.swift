//
//  SignInView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI
//import FirebaseAuth
//import Firebase
//import GoogleSignIn

struct SignInView: View {
    
    @StateObject private var loginData = UserStateViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isDetailActive = false
    @State private var isResetPassword = false
    
//    var googleAuth: GoogleAuth = GoogleAuth()

    var body: some View {
        NavigationView {
            ZStack {
                ZStack(alignment: .topLeading) {
                    GeometryReader { _ in
                        ScrollView(.vertical, showsIndicators: false) {
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
                                        Text("Вход")
                                            .font(.custom(FontsManager.Mulish.bold, size: 18))
                                            .frame(width: UIScreen.main.bounds.height * (1/4))
                                        Spacer()
                                        Spacer()
                                    }
                                    .padding()
                                }
                                .frame(maxWidth: .infinity)
                            }
                            
                            VStack {
                                Spacer()
                                Text("Рады видеть тебя снова!")
                                    .font(.custom(FontsManager.Mulish.bold, size: 20))
                                    .foregroundColor(Color.black)
                                    .padding(.vertical, 20)
                                
                                TextFieldForm(text: "Адрес электронной почты", bind: $loginData.email, promt: loginData.emailPrompt)
                                
                                PasswordForm(text: "Пароль", bind: $loginData.password, promt: loginData.passwordPrompt)
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        isResetPassword = true
                                    } label: {
                                        Text("Воcстановить пароль?")
                                            .font(.custom(FontsManager.Mulish.bold, size: 16))
                                            .foregroundColor(Color.theme.purple)
                                    }
                                    .sheet(isPresented: $isResetPassword) {
                                        if #available(iOS 16.0, *) {
                                            ResetPasswordView(isResetPassword: $isResetPassword)
                                                .presentationDetents([
                                                    .height(350),
                                                    .medium])
                                                .edgesIgnoringSafeArea(.all)
                                        } else {
                                            ResetPasswordView(isResetPassword: $isResetPassword)
                                        }
                                    }
                                }
                                .padding(20)
                                
                                VStack {
                                    Button {
                                        loginData.logIn()
                                    } label: {
                                        Text("Войти")
                                            .font(.custom(FontsManager.Mulish.bold, size: 18))
                                            .foregroundColor(Color.white)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color.theme.purple)
                                            .cornerRadius(10)
                                            .padding(.vertical, 20)
                                    }
                                }
                                .onAppear() {
                                    print("Is authenticated: \(loginData.isAuthenticated)")
                                }
                                .fullScreenCover(isPresented: $loginData.isAuthenticated, content: {
                                                TabBar()
                                            })
                                .alert(isPresented: $loginData.showIncorrectCredentialsAlert) {
                                                Alert(title: Text("Не верный email или пароль"))
                                            }
                                .padding()

                                VStack(spacing: 20) {
                                    Text("Войти через аккаунт:")
                                        .font(.custom(FontsManager.Mulish.regular, size: 16))
                                        .foregroundColor(Color.black)
                                    
    //                                FacebookAuth()
                                    
                                    Button {
//                                        GoogleAuth.share.signinWithGoogle(presenting: googleAuth.getRootViewController()) { error in
//                                            print("Error GoogleSignIn: \(String(describing: error))")
//                                        }
                                    } label: {
                                        HStack {
                                            Image("google")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .padding(.horizontal, 10)
                                                .background(Circle().fill(Color.white))
                                                .shadow(radius: 1)
                                            
                                            Text("Google")
                                                .font(.custom(FontsManager.Mulish.bold, size: 18))
                                                .foregroundColor(Color.theme.purple)
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(Color.white)
                                            
                                            Text("")
                                                .padding(.horizontal, 25)
                                        }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.theme.purple, lineWidth: 1)
                                        )
                                    }
                                    
                                }.padding(20)
                            }
                            
                        }
                        .navigationBarHidden(true)
                    }
                }
                .navigationBarHidden(true)
                
                if loginData.alert {
                    ZStack(alignment: .center) {
                        ErrorView(alert: $loginData.alert, error: $loginData.error)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    
}

struct ErrorView : View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View {
        
        GeometryReader { _ in
            
            VStack {
                
                HStack {
                    Text(self.error == "Восстановить" ? "Сообщение" : "Ошибка")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error == "Восстановить" ? "Ссылка на восстановление пароля отправлена успешно." : self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button {
                    self.alert.toggle()
                } label: {
                    Text(self.error == "Восстановить" ? "OK" : "Отмена")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color.theme.purple)
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .padding(.vertical, 200)
        .padding(.horizontal, 35)
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}


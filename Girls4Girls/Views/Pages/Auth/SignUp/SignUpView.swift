//
//  SignUpView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI
//import FirebaseAuth

struct SignUpView: View {
    
    @StateObject private var loginData = UserStateViewModel()
    
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var showAlert = false
    
    @State private var isPopoverShown = false
    @State private var showMainView = false
    
    @State private var isDetailActive = false
    @Environment(\.presentationMode) var presentationMode
    
    @State private var region: DropdownMenuOption? = nil

    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                GeometryReader { _ in
                    NavigationView {
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
                                        Text("Регистрация")
                                            .frame(width: UIScreen.main.bounds.height * (1/4))
                                            .foregroundColor(Color.theme.darkPurple)
                                        Spacer()
                                    }
                                    .padding()
                                }
                                .frame(maxWidth: .infinity)
                            }
                            
                            VStack {
                                Text("Присоединяйся!")
                                    .font(.custom(FontsManager.Mulish.bold, size: 20))
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                VStack(spacing:10) {
                                    TextFieldFormSignUp(text: "Адрес электронной почты", bind: $loginData.email, promt: loginData.emailPrompt)
                                    
                                    TextFieldFormSignUp(text: "Имя", bind: $loginData.first_name, promt: loginData.namePrompt)
                                    
                                    TextFieldFormSignUp(text: "Фамилия", bind: $loginData.last_name, promt: loginData.sureNamePrompt)
                                    
                                    PasswordFieldRegister(text: "Пароль", promt: loginData.passwordPrompt, bind: $loginData.password)
                                    
                                    PasswordFieldRegister(text: "Повторите пароль", promt: loginData.confirmPasswordPromt, bind: $loginData.password_confirm)
                                    
                                    /*
                                     Button {

                                     } label: {
                                         HStack {
                                             Text("Дальше")
                                                 .fontWeight(.semibold)
                                                 .font(.title3)
                                                 .foregroundColor(Color.white)
                                                 .padding()
                                                 .frame(maxWidth: .infinity)
                                         }
                                     }
                                     .background(Color.theme.purple)
                                     .cornerRadius(10)
                                     .padding(.vertical, 20)
                                     
                                     */
                                    
                                    // MARK: - Popover button for confirmation
                                    VStack {
                                        Button(action: {
                                            loginData.registerJWT()
                                            self.isPopoverShown.toggle()
                                        }) {
                                            Text("Завершить")
                                                .fontWeight(.semibold)
                                                .font(.title3)
                                                .foregroundColor(Color.white)
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(Color.theme.purple)
                                                .cornerRadius(10)
                                                .padding(.vertical, 20)
                                            
                                        }
                                        .popover(isPresented: $isPopoverShown, content: {
                                            ZStack {
                                                LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                                                    .opacity(0.7)
                                                    .ignoresSafeArea()
                                                
                                                VStack {
                                                    VStack {
                                                        Text("Мы отправили ссылку на электронную почту \(loginData.email) для подтверждения.")
                                                            .font(.body)
                                                            .foregroundColor(.black)
                                                            .padding()
                                                        
                                                        
                                                        Text("Пожалуйста проверьте свою почту.")
                                                            .font(.body)
                                                            .foregroundColor(.black)
                                                            .padding()
                                                        
                                                        
                                                        Text("Изменить электронную почту")
                                                            .underline()
                                                            .foregroundColor(Color.theme.darkPurple)
                                                            .onTapGesture {
                                                                guard let url = URL(string: "https://www.example.com") else { return }
                                                                UIApplication.shared.open(url)
                                                            }
                                                    }
                                                    
                                                    Button(action: {
                                                        self.isPopoverShown.toggle()
                                                        self.loginData.clearSignUp()
                                                    })
                                                    {
                                                        Text("Готово")
                                                            .fontWeight(.semibold)
                                                            .font(.title3)
                                                            .foregroundColor(Color.white)
                                                            .padding()
                                                            .frame(maxWidth: .infinity)
                                                            .background(Color.theme.purple)
                                                            .cornerRadius(10)
                                                            .padding(.vertical, 20)
                                                        
                                                    }
                                                    .padding()
                                                }
                                                .padding()
                                                .cornerRadius(10)
                                            }
                                        })
                                    }
                                    
                                    NavigationLink {
                                        TabBar()
                                            .navigationBarHidden(true)
                                    } label: {
                                        Text("Заполнить позже")
                                            .font(.body)
                                            .foregroundColor(Color.theme.darkPurple)
                                            .padding()
                                    }
                                }.padding()
                            }
                        }
                        .navigationBarHidden(true)
                    }
                }
            }
        }.navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

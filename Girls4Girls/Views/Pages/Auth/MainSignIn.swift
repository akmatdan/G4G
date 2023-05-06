//
//  MainSignIn.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI
//import FirebaseAuth
//import Firebase
//import GoogleSignIn

struct MainSignIn: View {
    
    @State private var animatedGradient = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: animatedGradient ? .topLeading: .bottomLeading, endPoint: animatedGradient ? .bottomTrailing: .topTrailing)
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true))
                        {
                            animatedGradient.toggle()
                        }
                    }
                
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 204, height: 164)
                        .frame(height: UIScreen.main.bounds.height * (1/2))
                    
                    Spacer()
                
                    
                    VStack {
                        PrimaryButton(content: SignInView(), text: "Войти", navTitle: "Вход")
                            .environmentObject(UserStateViewModel())
                        
                        SecondaryButton(content: SignUpView(), text: "Регистрация", navTitle: "Регистрация")
                            .environmentObject(UserStateViewModel())
                    }
                    .padding()
                    NavigationLink {
                        TabBar()
                    } label: {
                        Text("Остаться гостем")
                            .font(.custom(FontsManager.Mulish.semiBold, size: 14))
                            .foregroundColor(.white)
                            .padding()
                            .onAppear {
//                                Auth.auth().signInAnonymously() { authResult, error in
//                                    if let error = error {
//                                        print("Error signing in anonymously: \(error.localizedDescription)")
//                                        return
//                                    }
//                                    _ = authResult?.user
//                                    print("SignIn Anonymously")
//                                }
                            }
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainSignIn_Previews: PreviewProvider {
    static var previews: some View {
        MainSignIn()
    }
}

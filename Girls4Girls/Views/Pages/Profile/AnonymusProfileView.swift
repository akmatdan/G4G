//
//  AnonymusProfileView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 6/4/23.
//

import SwiftUI

struct AnonymusProfileView: View {
    @StateObject var loginData: UserStateViewModel = UserStateViewModel()
    
    var body: some View {
        NavigationView {
            
            ZStack {
                LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                    VStack {
                        Image("profileImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .padding(.vertical, 20)
                        
                        Text("Пожалуйста войдите или зарегистрируйтесь.")
                            .font(.custom(FontsManager.Mulish.bold, size: 20))
                            .fontWeight(.semibold)
                            .frame(width: 360, alignment: .center)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.vertical, 20)
                        
                        Text("Это позволяет проходить тесты, получать достижения и отслеживать свой прогресс.")
                            .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                            .frame(width: 360, alignment: .center)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.vertical, 20)
                        
                        
                        PrimaryButton(content: SignInView(), text: "Войти", navTitle: "")
                            .padding(.horizontal, 25)
                        
                        SecondaryButtonForm(content: SignUpView(), text: "Регистрация")
                        Spacer()
                    }
                    .padding(.top, 60)
                HeaderView(title: "Личный кабинет")
            }
        }
    }
}

struct AnonymusProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AnonymusProfileView()
    }
}

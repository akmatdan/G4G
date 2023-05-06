//
//  ContactView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 28/3/23.
//

import SwiftUI

struct ContactView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var loginData = UserStateViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
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
                            Text("Обратная связь")
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
                
                // MARK: CONTENT
                Text("У Вас возникли проблемы \nили появились вопросы? \nНапишите нам и мы ответим \nв скором времени.")
                    .font(.custom(FontsManager.Mulish.semiBold, size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                    .padding(20)
                
                TextField("Напишите нам...", text: $loginData.userCallBackText)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.custom(FontsManager.Mulish.semiBold, size: 18))
                    .multilineTextAlignment(.leading)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 300, alignment: .topLeading)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(20)
                
                SecondaryButtonForm(content: EmptyView(), text: "Отправить")
                Spacer()
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}

//
//  FinishAppForm.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 11/4/23.
//

import SwiftUI

struct FinishAppForm: View {
    
    @StateObject private var loginData = UserStateViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            
            ZStack {
                Image("confete")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(30))
                    .offset(x: -140, y: -250)
                
                Image("confete")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(30))
                    .offset(x: 210, y: -200)
                
                Image("confete")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(90))
                    .offset(x: -180, y: 210)
                
                Image("confete")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(30))
                    .offset(x: 100, y: 320)
            }
            
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
                            Text("Анкета")
                                .frame(width: 250)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.leading, 20)
                            Spacer()
                            Spacer()
                        }
                        .padding()
                    }
                    .background(.white)
                    .frame(maxWidth: .infinity)
                }
                Spacer()
                
                Text("Вы успешно подали заявку на участие в форуме. Результат будет сообщен вам по электронной почте.")
                    .font(.title2)
                    .foregroundColor(Color.theme.darkPurple)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
                
                HStack {
                    Button {
                        guard let window = UIApplication.shared.windows.first else { return }
                        let viewModel = UserStateViewModel()

                        let rootView = NavigationView {
                            TabBar()
                                .environmentObject(viewModel)
                                .navigationBarHidden(true)
                        }

                        window.rootViewController = UIHostingController(rootView: rootView)
                        window.makeKeyAndVisible()
                    } label: {
                        HStack {
                            Text("Вернуться на главную")
                                .fontWeight(.semibold)
                                .font(.body)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(10)
                                .frame(width: 250)
                        }
                    }
                    .background(Color.theme.purple)
                    .cornerRadius(10)
                    .padding(.vertical, 20)
                    .padding(.horizontal,25)
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            
        }
    }
}

struct FinishAppForm_Previews: PreviewProvider {
    static var previews: some View {
        FinishAppForm()
    }
}

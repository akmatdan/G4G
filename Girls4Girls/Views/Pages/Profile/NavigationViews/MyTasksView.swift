//
//  MyTasksView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 28/3/23.
//

import SwiftUI

struct MyTasksView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
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
                            Text("Мои тесты")
                                .frame(width: 250)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.leading, 20)
                            Spacer()
                            Spacer()
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Как избавиться от прокрастинации?")
                                    .font(.body)
                                    .frame(width: 270, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color.black)
                                Spacer()
                                Text("9/10")
                                    .foregroundColor(Color.green)
                            }
                            .padding(10)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                        }
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Как избавиться от прокрастинации?")
                                    .font(.body)
                                    .frame(width: 270, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color.black)
                                Spacer()
                                Text("6/10")
                                    .foregroundColor(Color.red)
                            }
                            .padding(10)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                        }
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Как избавиться от прокрастинации?")
                                    .font(.body)
                                    .frame(width: 270, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color.black)
                                Spacer()
                                Text("9/10")
                                    .foregroundColor(Color.green)
                            }
                            .padding(10)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                        }
                    }
                }
            }
        }
    }
}

struct MyTasksView_Previews: PreviewProvider {
    static var previews: some View {
        MyTasksView()
    }
}

//
//  MyApplicationsView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 28/3/23.
//

import SwiftUI

struct MyApplicationsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var loginData: UserStateViewModel = UserStateViewModel()
    
    @State var selectedIndex = 0
    let tabBarImageNames = ["Менторская программа", "Тренинги", "Форумы"]
    
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
                            Text("Мои заявки")
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
                // SelectedIndex of TabBar
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<3) { num in
                                Button(action: {
                                    selectedIndex = num
                                }, label: {
                                    if selectedIndex == num {
                                        Text("\(tabBarImageNames[num])")
                                            .foregroundColor(selectedIndex == num ? .white : Color(red: 0.2, green: 0.0, blue: 0.7))
                                            .padding(10)
                                            .background(Color.theme.purple)
                                            .cornerRadius(10)
                                            .padding(.horizontal, 5)
                                    } else {
                                        Text("\(tabBarImageNames[num])")
                                            .foregroundColor(selectedIndex == num ? .white : Color(red: 0.2, green: 0.0, blue: 0.7))
                                            .padding(10)
                                        .background(.white)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 5)
                                    }
                                }
                                )
                            }
                        }
                    }
                }
                switch selectedIndex {
                case 0:
                    // Mentor Applications
                    ApplicationCard()
                case 1:
                    // Traning Applications
                    TraningApplicationCard()
                default:
                    // Forum Applications
                    ApplicationCard()
                }
                Spacer()
            }
        }
    }
}

struct ApplicationCard: View {
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                VStack {
                    Text("Поток 1")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.black)
                    
                    Text("На рассмотрении")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.purple)
                        .padding(.vertical, 1)
                    
                    HStack {
                        VStack {
                            Text("Дата мероприятия")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkPurple)
                            
                            Text("23.05.23")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.vertical, 1)
                        }
                        VStack {
                            Text("Дэдлайн подачи")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.red)
                            
                            Text("23.05.23")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.red)
                                .padding(.vertical, 1)
                        }
                    }
                }
            }
            .frame(width: 330, alignment: .leading)
            .padding()
            .background(.white)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct TraningApplicationCard: View {
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                VStack {
                    HStack {
                        Text("Поток 1")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.black)
                        Spacer()
                        Text("г.Нарын")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color.secondary)
                    }
                    
                    Text("На рассмотрении")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.purple)
                        .padding(.vertical, 1)
                    
                    HStack {
                        VStack {
                            Text("Дата мероприятия")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkPurple)
                            
                            Text("23.05.23")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.vertical, 1)
                        }
                        VStack {
                            Text("Дэдлайн подачи")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.red)
                            
                            Text("23.05.23")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.red)
                                .padding(.vertical, 1)
                        }
                    }
                }
            }
            .frame(width: 330, alignment: .leading)
            .padding()
            .background(.white)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct ForumApplicationCard: View {
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                VStack {
                    Text("Поток 1")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.black)
                    
                    Text("На рассмотрении")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.purple)
                        .padding(.vertical, 1)
                    
                    HStack {
                        VStack {
                            Text("Дата мероприятия")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkPurple)
                            
                            Text("23.05.23")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.vertical, 1)
                        }
                        VStack {
                            Text("Дэдлайн подачи")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.red)
                            
                            Text("23.05.23")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color.red)
                                .padding(.vertical, 1)
                        }
                    }
                }
            }
            .frame(width: 330, alignment: .leading)
            .padding()
            .background(.white)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct MyApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        MyApplicationsView()
    }
}

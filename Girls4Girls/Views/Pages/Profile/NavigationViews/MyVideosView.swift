//
//  MyVideosView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 28/3/23.
//

import SwiftUI

struct MyVideosView: View {
    
    @StateObject private var netVM = NetworkViewModel()
    
    @State private var showingFilter = false
    
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
                                    .padding(.leading, 15)
                            }
                            Spacer()
                            Text("Видеоблог")
                                .frame(width: UIScreen.main.bounds.height * (1/4))
                            Spacer()
                            Spacer()
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        HStack {
                            Image("search")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20, alignment: .center)
                            
                            Text("Ищу")
                                .fontWeight(.semibold)
                                .font(.body)
                                .foregroundColor(Color.gray)
                                .frame(alignment: .leading)
                                .padding(.leading, 10)
                            
                            Spacer()
                        }
                        .padding()
                        .frame(width: 290)
                        .background(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.theme.darkPurple, lineWidth: 1)
                        )
                        .padding(.leading, 15)
                    }
                    
                    Button(action: {
                        showingFilter.toggle()
                    }) {
                        Image("filter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .center)
                            .padding(.horizontal, 30)
                    }
                    .fullScreenCover(isPresented: $showingFilter) {
                        if #available(iOS 16.0, *) {
                            NavigationView {
                                CategoriesView()
                            }
                        } else {
                            NavigationView {
                                CategoriesView()
                            }
                            // Fallback on earlier versions
                        }
                    }
                }
                .padding(.horizontal, 15)
                
                HStack {
                    Button {
                        
                    } label: {
                        HStack {
                            Text("По дате")
                                .fontWeight(.semibold)
                                .font(.body)
                                .foregroundColor(Color.white)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                            
                        }
                    }
                    .background(Color.theme.purple)
                    .cornerRadius(10)
                    .padding(.vertical, 20)
                    .padding(.leading, 30)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Text("По просмотрам")
                                .fontWeight(.semibold)
                                .font(.body)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.trailing, 30)
                }
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(netVM.videoBlog, id: \.id) { video in
                            VideoView(video: video)
                        }
                    }
                }
                .onAppear {
                    netVM.fetchData(for: .videoBlog)
                }
                Spacer()
            }
        }
    }
}

struct MyVideosView_Previews: PreviewProvider {
    static var previews: some View {
        MyVideosView()
    }
}

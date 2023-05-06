//
//  Videoblog.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/3/23.
//

import SwiftUI

struct Videoblog: View {
    var body: some View {
        Search_Filter()
    }
}

struct Video: Identifiable {
    let id = UUID()
    let title: String
}

struct Search_Filter: View {
    
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
            .padding(.top, 60)
            HeaderView(title: "Видеоблог")
        }
    }
}

struct Videoblog_Previews: PreviewProvider {
    static var previews: some View {
        Videoblog()
    }
}

struct CategoriesView:  View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isOptionsPresented = false
    
    var body: some View {
        
            ZStack {
                LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("Категории:")
                            .font(.title2)
                            .frame(width: 200, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.leading, 15)
                        
                        Spacer()
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.gray)
                                .padding(20)
                        }
                    }
                    
                    VStack {
                        
//                        ForEach(categories) { category in
//                            HStack {
//                                Image(category.isMarked ? "mark" : "unMark")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 20, height: 20)
//                                    .onTapGesture {
//                                        if let index = categories.indices.first(where: { categories[$0].id == category.id }) {
//                                            categories[index].isMarked.toggle()
//                                        }
//
//
//                                    }
//                                Text(category.name)
//                            }
//                            .font(.body)
//                            .frame(width: 370, alignment: .leading)
//                            .multilineTextAlignment(.leading)
//                            .foregroundColor(Color.theme.darkPurple)
//                            .padding(.leading, 15)
//                        }
                        
                    }
                    PrimaryButton(content: EmptyView(), text: "Сохранить", navTitle: "")
                        .padding(.horizontal, 20)
                   Spacer()
                    
                }.padding(.top, 60)
                
                HeaderView(title: "Видеоблог")
            }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}

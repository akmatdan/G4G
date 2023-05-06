//
//  ForumsView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 19/3/23.
//

import SwiftUI

struct ForumsView: View {
    
    @StateObject private var netVM = NetworkViewModel()
    
    let gridItem = GridItem(.flexible(minimum: 100, maximum: 200), spacing: 10)
    @State private var isShowingPopup = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        
                        Text("Предстоящие форумы")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.top, 15)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(netVM.forums, id: \.id) { forum in
                                    ForumView(forumData: forum)
                                }
                            }
                        }
                        .onAppear {
                            netVM.fetchData(for: .forums)
                        }
                        
                        Text("Прошедшие форумы")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.top, 15)
                        
                        LazyVGrid(columns: [gridItem, gridItem]) {
                            
                            ForEach(netVM.pastEvents, id: \.id) { pastEvents in
                                
                                ForEach(pastEvents.pictures, id: \.id) { picture in
                                    
                                    Button {
                                        isShowingPopup = true
                                    } label: {
                                        VStack {
                                            GeometryReader { geometry in
                                                let imageURL = URL(string: "https://res.cloudinary.com/dk9iepflr/\(picture.image)")
                                                AsyncImage(url: imageURL) { image in
                                                    image
                                                        .resizable()
                                                        .scaledToFill()
                                                        .cornerRadius(10)
                                                        .frame(width: 100, height: 100)
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                            .frame(width: 100, height: 100)
                                        }
                                        .sheet(isPresented: $isShowingPopup) {
                                            PopupViewMain(image: picture.image,
                                                          title: pastEvents.title,
                                                          date: pastEvents.created_date,
                                                          detail: pastEvents.content,
                                                          isPresented: $isShowingPopup)
                                        }
                                    }
                                }
                            }
                        }
                        .onAppear {
                            netVM.fetchData(for: .pastEvents)
                        }
                        
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarHidden(true)

    }
}

struct ForumsView_Previews: PreviewProvider {
    static var previews: some View {
        ForumsView()
    }
}

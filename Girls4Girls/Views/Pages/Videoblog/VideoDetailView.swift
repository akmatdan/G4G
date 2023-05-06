//
//  VideoDetailView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 25/3/23.
//

import SwiftUI

struct VideoDetailView: View {
    
    @StateObject private var netVM = NetworkViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingTestVideo = false
    @State private var showingVideoDetail = false
    @State var heartTapped: Bool = false
    
    let video: Videos
    
    var body: some View {
            VStack {
                ZStack {
                    LinearGradient(colors: [Color.theme.pink, Color.theme.blue, Color.theme.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .opacity(0.7)
                        .ignoresSafeArea()
                    
                    VStack {
                        
                        // Nav
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
                                            .padding(.leading, 20)
                                    }
                                    Spacer()
                                    Text("Видео")
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
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            // Content
                            VStack {
                                
                                let videoUrlString = "\(video.url)"
                                let videoUrl = URL(string: videoUrlString)
                                let urlComponents = URLComponents(string: videoUrlString)
                                let queryItems = urlComponents?.queryItems
                                let videoId = queryItems?.first(where: { $0.name == "v" })?.value
                                
                                    YoutubeVideoView(videoID: videoId ?? "")
                                        .frame(width: 350, height: 200)
                                        .cornerRadius(10)
                                        .padding(.top, 20)
                                HStack {
                                    Text(video.title)
                                        .font(.custom(FontsManager.Mulish.semiBold, size: 20))
                                        .frame(width: 300, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                        .padding(.top, 10)
                                    
                                    if heartTapped {
                                        Button {
                                           heartTapped = false
                                        } label: {
                                            Image("filHeart")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 20, height: 20)
                                                .padding(.trailing, 20)
                                        }
                                    } else {
                                        Button {
                                           heartTapped = true
                                        } label: {
                                            Image("heart")
                                                .resizable()
                                                .scaledToFit()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 20, height: 20)
                                                .padding(.trailing, 20)
                                        }
                                    }
                                }
                                .padding()
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    ForEach(video.categories, id: \.id) { category in
                                        HStack {
                                            Text(category.name)
                                                .font(.custom(FontsManager.Mulish.regular, size: 16))
                                                .foregroundColor(Color.theme.darkPurple)
                                                .padding(10)
                                                .background(Color.theme.purple)
                                                .cornerRadius(10)
                                                .padding(.leading, 25)
                                            Spacer()
                                        }
                                    }
                                }
                                .padding(.horizontal, 15)
                                
                                VStack {
                                    Text("Ключевые выводы:")
                                        .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                                        .frame(width: 320, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                    
                                    Text(video.description)
                                        .font(.custom(FontsManager.Mulish.regular, size: 16))
                                        .frame(width: 320, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                        .padding(.top, 5)
                                }
                                .padding()
                                .background(.white)
                                .cornerRadius(10)
                                .padding(.top, 10)
                                
                                Text("Про спикера:")
                                    .font(.custom(FontsManager.Mulish.regular, size: 16))
                                    .frame(width: 330, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.gray)
                                    .padding(.top, 5)
                                
                                HStack {
                                    Image("mentor1")
                                        .resizable()
                                        .frame(width: 85, height: 85)
                                        .clipShape(Circle())
                                        .shadow(radius: 5)
                                    
                                    VStack {
                                        Text(video.speaker)
                                            .font(.custom(FontsManager.Mulish.regular, size: 16))
                                            .frame(width: 250, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(Color.theme.darkPurple)
                                        
                                        Text("Ментор")
                                            .font(.custom(FontsManager.Mulish.regular, size: 16))
                                            .frame(width: 250, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(Color.secondary)
                                        
                                        Text("Я уверена, что вы сможете достичь больших высот и стать настоящими профессионалами в своей области. Но иногда путь к успеху может быть непростым и возникать трудности, особенно в начале.")
                                            .font(.custom(FontsManager.Mulish.regular, size: 16))
                                            .frame(width: 250, alignment: .leading)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(Color.theme.darkPurple)
                                    }
                                }
                                
                                Text("Рекомендационные:")
                                    .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                                    .frame(width: 320, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color.theme.darkPurple)
                                    .padding(.top, 10)
                                
                                // Videos
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
                                .padding(.leading, 10)
                            }
                        }
                        
                    }
                }
                
                VStack {
//                    Text("Зарегистрируйтесь или войдите, чтобы пройти тест для закрепления темы и получить достижение.")
//                        .font(.body)
//                        .frame(width: 350, alignment: .leading)
//                        .multilineTextAlignment(.leading)
//                        .foregroundColor(Color.theme.darkPurple)
                    
                    NavigationLink {
                        TestVideoView(video: video)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Пройти тест")
                            .fontWeight(.semibold)
                            .font(.body)
                            .padding(.horizontal, 20)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(10)
                            .background(Color.theme.purple)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
            }
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(video: Videos(id: 2, url: "", categories: [], title: "", speaker: "", description: ""))
    }
}

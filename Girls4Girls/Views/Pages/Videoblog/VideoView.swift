//
//  VideoView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 22/4/23.
//

import SwiftUI
import WebKit
import CoreData

struct YoutubeVideoView: UIViewRepresentable {
    let videoID: String
        
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
        
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct VideoView: View {
    
    @StateObject private var netVM = NetworkViewModel()
    @State private var showingVideoDetail = false
    let video: Videos
    @Environment(\.managedObjectContext) private var viewContext
    @State var heartTapped: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    Button {
                        showingVideoDetail = true
                    } label: {
                        
                        ZStack {

                            VStack {
                                let videoUrlString = "\(video.url)"
                                let videoUrl = URL(string: videoUrlString)
                                let urlComponents = URLComponents(string: videoUrlString)
                                let queryItems = urlComponents?.queryItems
                                let videoId = queryItems?.first(where: { $0.name == "v" })?.value
                                
                                    YoutubeVideoView(videoID: videoId ?? "")
                                        .frame(width: 300, height: 200)
                                        .cornerRadius(10)
                                        .padding(.top, 20)
                                
                                HStack {
                                    Text(video.title)
                                        .font(.custom(FontsManager.Mulish.semiBold, size: 20))
                                        .frame(width: 250, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                        .foregroundColor(Color.theme.darkPurple)
                                    
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
                                
                                Text(video.speaker)
                                    .font(.custom(FontsManager.Mulish.regular, size: 16))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 25)
                                    .foregroundColor(Color.theme.darkPurple)
                                
                                HStack {
                                    Image("star")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 20, height: 20)
                                        .padding(.leading, 30)
                                    Text("4.7")
                                        .font(.custom(FontsManager.Mulish.regular, size: 16))
                                        .frame(width: 250, alignment: .leading)
                                        .padding()
                                        .foregroundColor(Color.theme.darkPurple)
                                    Spacer()
                                }
                                
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
                                
                                HStack {
                                    Text("2 месяца назад")
                                        .font(.custom(FontsManager.Mulish.regular, size: 16))
                                        .frame(width: 150, alignment: .leading)
                                        .padding()
                                        .foregroundColor(Color.theme.darkGray)
                                    
                                    Spacer()
                                    
                                    Image("eye")
                                    
                                    Text("300")
                                        .font(.custom(FontsManager.Mulish.regular, size: 16))
                                        .padding()
                                        .foregroundColor(Color.theme.darkGray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                            }
                            .background(.white)
                            .cornerRadius(10)
                            .padding(20)
                        }
                        .padding()
                        .fullScreenCover(isPresented: $showingVideoDetail) {
                            if #available(iOS 16.0, *) {
                                NavigationView {
                                    VideoDetailView(video: video)
                                }
                            } else {
                                NavigationView {
                                    VideoDetailView(video: video)
                                }
                            }
                        }
                    }
                    .padding(.vertical, -30)
                }
            }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video: Videos(id: 1, url: "", categories: [], title: "", speaker: "", description: ""))
    }
}

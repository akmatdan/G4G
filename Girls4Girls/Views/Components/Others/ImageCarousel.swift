//
//  ImageCarousel.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/2/23.
//

import SwiftUI

struct ImageCarousel9: View {
    
    @State private var isShowingPopup = false
    @State private var selectedImageIndex = 0
    
    let images: [Image]
    let titles: [String]
    let detail: [String]
    let date: [String]
    let city: [String]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<images.count) { index in
                            Button {
                                selectedImageIndex = index
                                isShowingPopup = true
                            } label: {
                                VStack {
                                    GeometryReader { geometry in
                                        images[index]
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fill)
                                            .cornerRadius(10)
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                    }
                                    .frame(width: 260, height: 186) // set the initial size of each image
                                    
                                    Text(titles[index])
                                        .font(.custom(FontsManager.Mulish.bold, size: 18))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
        .sheet(isPresented: $isShowingPopup) {
                PopupView9(image: images[selectedImageIndex],
                          title: titles[selectedImageIndex],
                          date: date[selectedImageIndex],
                          detail: detail[selectedImageIndex],
                          isPresented: $isShowingPopup)

        }   
    }
}
struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



//struct ImageCarouselMentors: View {
//
//    @State private var isShowingPopup = false
//    @State private var selectedImageIndex = 0
//
//    let images: [Image]
//    let imageCircle: [Image]
//    let name: [String]
//    let detail: [String]
//    let linkedIn: [String]
//    let instagram: [String]
//
//    var body: some View {
//
//        ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(0..<images.count) { index in
//                            Button {
//                                selectedImageIndex = index
//                                isShowingPopup = true
//                            } label: {
//
//                                    ZStack {
//                                        GeometryReader { geometry in
//                                            images[index]
//                                                .resizable()
//                                                .scaledToFit()
//                                                .aspectRatio(contentMode: .fill)
//                                                .cornerRadius(10)
//                                                .frame(width: geometry.size.width, height: geometry.size.height)
//                                        }
//                                        .frame(width: 165, height: 156) // set the initial size of each image
//
//                                        GeometryReader { geometry in
//                                            imageCircle[index]
//                                                .resizable()
//                                                .scaledToFit()
//                                                .aspectRatio(contentMode: .fill)
//                                                .cornerRadius(10)
//                                                .frame(width: geometry.size.width, height: geometry.size.height)
//                                        }
//                                        .offset(y: 75)
//                                        .frame(width: 58, height: 58) // set the initial size of each image
//
//                                        Text(name[index])
//                                            .font(.custom(FontsManager.Mulish.regular, size: 15))
//                                            .frame(width: 100)
//                                            .multilineTextAlignment(.center)
//                                            .foregroundColor(Color.theme.darkPurple)
//                                            .padding()
//                                            .offset(y: 75)
//                                    }
//                                    .frame(height: 210)
//                                    Spacer()
//                            }
//                            .padding(.horizontal, 10)
//                        }
//                    }
//                }
//        .sheet(isPresented: $isShowingPopup) {
//                PopupViewMentors(image: images[selectedImageIndex],
//                          name: name[selectedImageIndex],
//                          detail: detail[selectedImageIndex],
//                          linkedIn: linkedIn[selectedImageIndex],
//                          instagram: instagram[selectedImageIndex],
//                          isPresented: $isShowingPopup)
//                .ignoresSafeArea()
//        }
//    }
//}


struct UpcomingEventsTreningsCarousel: View {
    
    @State private var isShowingPopup = false
    @State private var selectedImageIndex = 0
    
    let images: [Image]
    let titles: [String]
    let detail: [String]
    let date: [String]
    let city: [String]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<images.count) { index in
                            Button {
                                selectedImageIndex = index
                                isShowingPopup = true
                            } label: {
                                VStack {
                                    GeometryReader { geometry in
                                        images[index]
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fill)
                                            .cornerRadius(10)
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                    }
                                    .frame(width: 260, height: 186) // set the initial size of each image
                                    
                                    Text(titles[index])
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(width: 260, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                        .padding(5)
                                    
                                    Text(date[index])
                                        .font(.body)
                                        .frame(width: 260, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                    
                                    Text(city[index])
                                        .font(.body)
                                        .frame(width: 260, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack {
                                            Text("Подать заявку")
                                                .font(.custom(FontsManager.Mulish.bold, size: 16))
                                                .padding(.horizontal, 20)
                                                .foregroundColor(Color.theme.darkPurple)
                                                .padding()
                                                .frame(width: .infinity)
                                                .background(.white)
                                                .cornerRadius(15)
                                                .padding(.leading, 15)
                                            
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
        .sheet(isPresented: $isShowingPopup) {
                PopupTreningView(image: images[selectedImageIndex],
                          title: titles[selectedImageIndex],
                          date: date[selectedImageIndex],
                          detail: detail[selectedImageIndex],
                          isPresented: $isShowingPopup)
                .background(.white) // set the background color of the PopupView to clear
                .ignoresSafeArea()
        }
    }
}

struct UpcomingEventsForumsCarousel: View {
    
    @State private var isShowingPopup = false
    @State private var selectedImageIndex = 0
    
    let images: [Image]
    let titles: [String]
    let detail: [String]
    let date: [String]
    let city: [String]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<images.count) { index in
                            Button {
                                selectedImageIndex = index
                                isShowingPopup = true
                            } label: {
                                VStack {
                                    GeometryReader { geometry in
                                        images[index]
                                            .resizable()
                                            .scaledToFit()
                                            .aspectRatio(contentMode: .fill)
                                            .cornerRadius(10)
                                            .frame(width: geometry.size.width, height: geometry.size.height)
                                    }
                                    .frame(width: 260, height: 186) // set the initial size of each image
                                    
                                    Text(titles[index])
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(width: 260, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                        .padding(5)
                                    
                                    Text(date[index])
                                        .font(.body)
                                        .frame(width: 260, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                    
                                    Text(city[index])
                                        .font(.body)
                                        .frame(width: 260, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color.theme.darkPurple)
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack {
                                            Text("Записаться")
                                                .font(.custom(FontsManager.Mulish.bold, size: 16))
                                                .padding(.horizontal, 20)
                                                .foregroundColor(Color.theme.darkPurple)
                                                .padding()
                                                .frame(width: .infinity)
                                                .background(.white)
                                                .cornerRadius(15)
                                                .padding(.leading, 15)
                                            
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
        
        .sheet(isPresented: $isShowingPopup) {
            PopupForumView(image: images[selectedImageIndex],
                          title: titles[selectedImageIndex],
                          date: date[selectedImageIndex],
                          detail: detail[selectedImageIndex],
                          isPresented: $isShowingPopup)
                .background(.white) // set the background color of the PopupView to clear
                .ignoresSafeArea()
        }
        
    }
}

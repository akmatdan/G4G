//
//  EventsView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 19/4/23.
//

import SwiftUI

struct NewsView: View {
    
    let news: News
    @State private var isShowingPopup = false
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter
        }()
    
    var body: some View {
        Button {
            isShowingPopup = true
        } label: {
            VStack {
                GeometryReader { geometry in
                    let imageURL = URL(string: "https://res.cloudinary.com/dk9iepflr/\(news.poster)")
                    AsyncImage(url: imageURL) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 280, height: 186)
                                    .cornerRadius(10)
                            } placeholder: {
                                ProgressView()
                            }
                }
                .frame(width: 280, height: 186)
                
                Text(news.title)
                    .font(.custom(FontsManager.Mulish.bold, size: 18))
                    .frame(width: 280, alignment: .leading)
                    .padding()
                    .foregroundColor(Color.theme.darkPurple)
                
                let dateString = news.created_date
                        let date = ISO8601DateFormatter().date(from: dateString)
                let formattedDateString = dateFormatter.string(from: date ?? Date())
                
                Text(formattedDateString)
                    .font(.custom(FontsManager.Mulish.regular, size: 16))
                    .frame(width: 280, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundColor(Color.theme.darkGray)
                    .padding(.bottom, 15)
            }
            
        }
        .padding(.horizontal, 5)
        .sheet(isPresented: $isShowingPopup) {
            PopupViewMain(image: news.poster,
                          title: news.title,
                          date: news.created_date,
                          detail: news.content,
                          isPresented: $isShowingPopup)
        }
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(news: News(id: 1, title: "Title", poster: "image/upload/v1682071808/tsyby4xvmpk1dwwtfkrl.png", content: "Contatne", created_date: "2000.02.02"))
    }
}

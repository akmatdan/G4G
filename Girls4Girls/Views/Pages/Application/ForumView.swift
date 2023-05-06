//
//  ForumView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 19/4/23.
//

import SwiftUI

struct ForumView: View {
    
    let forumData: Forum
    @State private var isShowingPopup = false
    @State var isFormOpen: Bool = false
    
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
                    let imageURL = URL(string: "https://res.cloudinary.com/dk9iepflr/\(forumData.image)")
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
                .frame(width: 280, height: 186) // set the initial size of each image
                
                VStack(spacing: 5) {
                    Text(forumData.name)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 18))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.darkPurple)
                    
                    let dateString = forumData.start_date
                    let date = ISO8601DateFormatter().date(from: dateString)
                    let formattedDateString = dateFormatter.string(from: date ?? Date())
                    
                    Text(formattedDateString)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.darkPurple)
                    
                    Text(forumData.location)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.darkPurple)
                }
                
                Button {
                    isFormOpen = true
                } label: {
                    HStack {
                        Text("Записаться на форум")
                            .font(.custom(FontsManager.Mulish.bold, size: 16))
                            .foregroundColor(Color.theme.darkPurple)
                            .padding()
                            .frame(width: 250)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.leading, 10)
                        
                        Spacer()
                    }
                }
                .fullScreenCover(isPresented: $isFormOpen) {
                    FormApplForm(forumData: forumData)
                }
            }
            
        }
        .padding(.horizontal, 5)
        .sheet(isPresented: $isShowingPopup) {
            PopupViewMain(image: forumData.image,
                      title: forumData.name,
                      date: forumData.start_date,
                      detail: forumData.description,
                      isPresented: $isShowingPopup)
        }
    }
}

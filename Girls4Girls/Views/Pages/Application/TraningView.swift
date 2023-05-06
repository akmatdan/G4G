//
//  TraningView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 27/3/23.
//

import SwiftUI

struct TraningView: View {
    
    let traning: Traning
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
                    let imageURL = URL(string: "https://res.cloudinary.com/dk9iepflr/\(traning.image)")
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
                    
                    Text(traning.name)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 18))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.darkPurple)
                    
                    let dateString = traning.start_date
                    let date = ISO8601DateFormatter().date(from: dateString)
                    let formattedDateString = dateFormatter.string(from: date ?? Date())
                    
                    Text(formattedDateString)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.darkPurple)
                    
                    Text(traning.location)
                        .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.theme.darkPurple)
                }
                Button {
                    isFormOpen = true
                } label: {
                    HStack {
                        Text("Записаться на тренинг")
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
                    TraningAppForm(trainingId: traning)
                }
            }
            
        }
        .padding(.horizontal, 5)
        .sheet(isPresented: $isShowingPopup) {
            PopupViewMain(image: traning.image,
                      title: traning.name,
                      date: traning.start_date,
                      detail: traning.description,
                      isPresented: $isShowingPopup)
        }
    }
}

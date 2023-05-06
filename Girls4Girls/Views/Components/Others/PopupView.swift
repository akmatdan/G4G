//
//  PopupView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 12/3/23.
//

import SwiftUI

struct PopupView9: View {
    
    var image: Image
    var title: String
    var date: String
    var detail: String
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }
            .padding(.trailing)
            
            ZStack {
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .frame(width: 340, height: 186)
                Image("blobs")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
            Text(title)
                .font(.custom(FontsManager.Mulish.bold, size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundColor(Color.theme.darkPurple)
                .padding(.horizontal)
            
            Text(detail)
                .font(.custom(FontsManager.Mulish.regular, size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .foregroundColor(Color.theme.darkPurple)
                .padding(.horizontal)
            
            Spacer()
        }
        
    }
}

struct PopupViewMain: View {
    
    var image: String
    var title: String
    var date: String
    var detail: String
    
    @Binding var isPresented: Bool
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter
        }()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }
            .padding(.trailing)
            
            ZStack {
                let imageURL = URL(string: "https://res.cloudinary.com/dk9iepflr/\(image)")
                AsyncImage(url: imageURL) { image in
                            image
                        .resizable()
                        .scaledToFill()
                        
                        .frame(width: 330, height: 200)
                        .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                Image("blobs")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: 320, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.theme.darkPurple)
                .padding()
            
            Text(detail)
                .font(.body)
                .frame(width: 320, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.gray)
                .padding()
            
            let dateString = date
                    let date = ISO8601DateFormatter().date(from: dateString)
            let formattedDateString = dateFormatter.string(from: date ?? Date())
            
            Text(formattedDateString)
                .font(.body)
                .frame(width: 320, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.theme.darkPurple)
                .padding()
            
            Spacer()
        }
        
    }
}


struct PopupViewMentors: View {
    
    var image: String
    var name: String
    var detail: String
    var linkedIn: String
    var instagram: String
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }
            .padding(.trailing)
            
            ZStack {
                let imageURL = URL(string: "https://res.cloudinary.com/dk9iepflr/\(image)")
                AsyncImage(url: imageURL) { image in
                            image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 186)
                        .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
            }
            
            Text(name)
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: 320, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.theme.darkPurple)
                .padding()
            
            Text(detail)
                .font(.body)
                .frame(width: 320, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.gray)
                .padding()
            
            Text("LinkedIn: \(linkedIn)")
                .font(.body)
                .frame(width: 320, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.theme.darkPurple)
                
            
            Text("Instagram: \(instagram)")
                .font(.body)
                .frame(width: 320, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.theme.darkPurple)
                
            
            Spacer()
        }
    }
}

struct PopupTreningView: View {
    
    var image: Image
    var title: String
    var date: String
    var detail: String
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter
        }()
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }
            .padding(.trailing)
            
            ZStack {
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .frame(width: 300, height: 186)
            }
            
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: 300, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.theme.darkPurple)
                .padding()
            
            Text(detail)
                .font(.body)
                .frame(width: 300, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.gray)
                .padding()
            
            let dateString = date
                    let date = ISO8601DateFormatter().date(from: dateString)
            let formattedDateString = dateFormatter.string(from: date ?? Date())
            
            Text(formattedDateString)
                .font(.body)
                .frame(width: 300, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.theme.darkPurple)
                .padding()
            
            NavigationLink {
                
            } label: {
                HStack {
                    Text("Подать заявку")
                        .font(.custom(FontsManager.Mulish.bold, size: 16))
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 300)
                        .background(Color.theme.darkPurple)
                        .cornerRadius(10)
                        .padding(.leading, 40)
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        
    }
}

struct PopupForumView: View {
    
    var image: Image
    var title: String
    var date: String
    var detail: String
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter
        }()
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }
            .padding(.trailing)
            
            ZStack {
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .frame(width: 300, height: 186)
            }
            
            
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: 300, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.theme.darkPurple)
                .padding()
            
            Text(detail)
                .font(.body)
                .frame(width: 300, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.gray)
                .padding()
            
            let dateString = date
                    let date = ISO8601DateFormatter().date(from: dateString)
            let formattedDateString = dateFormatter.string(from: date ?? Date())
            Text(formattedDateString)
                .font(.body)
                .frame(width: 300, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.theme.darkPurple)
                .padding()
            
            NavigationLink {
                
            } label: {
                HStack {
                    Text("Записаться")
                        .font(.custom(FontsManager.Mulish.bold, size: 16))
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 300)
                        .background(Color.theme.darkPurple)
                        .cornerRadius(10)
                        .padding(.leading, 40)
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
    }
}

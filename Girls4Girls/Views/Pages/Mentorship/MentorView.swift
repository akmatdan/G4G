//
//  MentorView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 13/4/23.
//

import SwiftUI

struct MentorView: View {
    
    let mentor: Mentor
    @State private var isShowingPopup = false
    
    var body: some View {
        Button {
            isShowingPopup = true
        } label: {
            ZStack {
                GeometryReader { geometry in
                    let imageURL = URL(string: "https://res.cloudinary.com/dk9iepflr/\(mentor.picture)")
                    AsyncImage(url: imageURL) { image in
                                image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 165, height: 156)
                            .cornerRadius(10)
                            } placeholder: {
                                ProgressView()
                            }
                }
                .frame(width: 165, height: 156) // set the initial size of each image
                
                GeometryReader { geometry in
                    if let id = mentor.id {
                        if id % 2 == 0 {
                            Image("nameCircle1")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(10)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        } else {
                            Image("nameCircle2")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(10)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                        }
                    } else {
                        // Handle case where ID is missing
                        Text("Missing ID")
                    }
                }
                .offset(y: 75)
                .frame(width: 58, height: 58) // set the initial size of each image
                
                Text(mentor.name)
                    .font(.custom(FontsManager.Mulish.regular, size: 15))
                    .frame(width: 100)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.theme.darkPurple)
                    .padding()
                    .offset(y: 75)
            }
            .frame(height: 210)
            Spacer()
        }
        .padding(.horizontal, 10)
        .sheet(isPresented: $isShowingPopup) {
            PopupViewMentor(picture: mentor.picture,
                             name: mentor.name,
                             detail: mentor.description,
                             linkedIn: mentor.linkedin,
                             instagram: mentor.instagram,
                      isPresented: $isShowingPopup)
        }
    }
}

//struct MentorView_Previews: PreviewProvider {
//    static var previews: some View {
//        MentorView()
//    }
//}

struct PopupViewMentor: View {
    
    var picture: String
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
                let imageURL = URL(string: "https://res.cloudinary.com/dk9iepflr/\(picture)")
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

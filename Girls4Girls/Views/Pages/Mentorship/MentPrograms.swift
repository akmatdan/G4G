//
//  MentPrograms.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/4/23.
//

import SwiftUI


struct MentPrograms: View {
    
    let mentorships: Mentorships
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
                    let imageURL = URL(string: "https://res.cloudinary.com/dk9iepflr/\(mentorships.image)")
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
                
                Text(mentorships.name)
                    .font(.custom(FontsManager.Mulish.bold, size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .foregroundColor(Color.theme.darkPurple)
                
                let dateString = mentorships.start_date
                        let date = ISO8601DateFormatter().date(from: dateString)
                let formattedDateString = dateFormatter.string(from: date ?? Date())
                
                Text(formattedDateString)
                    .font(.custom(FontsManager.Mulish.regular, size: 16))
                    .frame(width: 280, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundColor(Color.theme.darkGray)
                
                Button {
                    isFormOpen = true
                } label: {
                    HStack {
                        Text("Записаться на поток")
                            .font(.custom(FontsManager.Mulish.bold, size: 16))
                            .foregroundColor(Color.theme.darkPurple)
                            .padding()
                            .frame(width: 200)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.leading, 15)
                        
                        Spacer()
                    }
                }
                .fullScreenCover(isPresented: $isFormOpen) {
                    MentorshipForm(mentorshipProgram: mentorships)
                }
            }
            
        }
        .padding(.horizontal, 5)
        .sheet(isPresented: $isShowingPopup) {
            PopupMentorshipView(mentorships: mentorships,
                                name: mentorships.name,
                                start_date: mentorships.start_date,
                                end_date: mentorships.end_date,
                                image: mentorships.image,
                                city: mentorships.city,
                                location: mentorships.location,
                                description: mentorships.description,
                                isShowingPopup: $isShowingPopup)
        }
    }
}

struct MentPrograms_Previews: PreviewProvider {
    static var previews: some View {
        MentPrograms(mentorships: Mentorships(id: 1, event: "", start_date: "", end_date: "", image: "", created_date: "", is_active: true, name: "", city: "", description: "", location: ""))
    }
}

struct PopupMentorshipView: View {
    
    let mentorships: Mentorships
    
    var name: String
    var start_date: String
    var end_date: String
    var image: String
    var city: String
    var location: String
    var description: String
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter
        }()
    
    @Binding var isShowingPopup: Bool
    @State var isFormOpen: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { isShowingPopup = false }) {
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
                .font(.custom(FontsManager.Mulish.bold, size: 18))
                .frame(width: 280, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 10)
                .foregroundColor(Color.theme.darkPurple)
            
            Text(description)
                .font(.custom(FontsManager.Mulish.regular, size: 16))
                .frame(width: 280, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .padding(.bottom, 10)
                .foregroundColor(Color.theme.darkPurple)
            
            let start_date = start_date
            let  end_date = end_date
            let date = ISO8601DateFormatter().date(from: start_date)
            let formattedStart_date = dateFormatter.string(from: date ?? Date())
            let formattedEnd_date = dateFormatter.string(from: date ?? Date())
            
            Text("Дата начала: \(formattedStart_date)")
                .font(.custom(FontsManager.Mulish.regular, size: 16))
                .frame(width: 280, alignment: .leading)
                .padding(.horizontal)
                .foregroundColor(Color.theme.darkGray)
            
            Text("Дата начала: \(formattedEnd_date)")
                .font(.custom(FontsManager.Mulish.regular, size: 16))
                .frame(width: 280, alignment: .leading)
                .padding(.horizontal)
                .foregroundColor(Color.theme.darkGray)
            
            Text(city)
                .font(.custom(FontsManager.Mulish.regular, size: 16))
                .frame(width: 280, alignment: .leading)
                .padding(.horizontal)
                .foregroundColor(Color.theme.darkGray)
            
            Text(location)
                .font(.custom(FontsManager.Mulish.regular, size: 16))
                .frame(width: 280, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 10)
                .foregroundColor(Color.theme.darkGray)
            
            Button {
                isFormOpen = true
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
            .fullScreenCover(isPresented: $isFormOpen) {
                MentorshipForm(mentorshipProgram: mentorships)
            }
            
            Spacer()
        }
    }
}

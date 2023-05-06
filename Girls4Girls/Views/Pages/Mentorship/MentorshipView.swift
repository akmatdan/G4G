//
//  MentorshipView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 24/2/23.
//

import SwiftUI

struct MentorshipView: View {
    
    @StateObject private var netVM = NetworkViewModel()
    @State var isFormOpen: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        VStack{
                            Text("Следующий поток на менторскую программу через:")
                                .font(.custom(FontsManager.Mulish.bold, size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .foregroundColor(Color.black)
                            
                            Text("21 дней.")
                                .font(.custom(FontsManager.Mulish.bold, size: 20))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .foregroundColor(Color.theme.darkPurple)
                                .padding(.bottom, 15)
                        }
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(netVM.mentorships, id: \.id) { mentorship in
                                    MentPrograms(mentorships: mentorship)
                                }
                            }
                        }
                        .onAppear {
                            netVM.fetchData(for: .mentorships)
                        }
                        
                        Text("Менторы")
                            .font(.title2)
                            .frame(width: 360, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.top, 20)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(netVM.mentors, id: \.id) { mentor in
                                    MentorView(mentor: mentor)
                                }
                            }
                        }
                        .onAppear {
                            netVM.fetchData(for: .mentors)
                        }
                        .padding(.horizontal, 10)
                        
                        Text("Выпускники")
                            .font(.title2)
                            .frame(width: 360, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.theme.darkPurple)
                            .padding(.top, 20)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(netVM.menty, id: \.id) { menty in
                                    MentyView(menty: menty)
                                }
                            }
                        }
                        .onAppear {
                            netVM.fetchData(for: .menty)
                        }
                        .padding(.horizontal, 10)
                    }
                }
                .padding(.top, 60)
                
                HeaderView(title: "Менторство")
                
                Spacer()
            }
            .themeGradient()
        }
        .navigationBarHidden(true)
    }
}

struct MentorshipView_Previews: PreviewProvider {
    static var previews: some View {
        MentorshipView()
    }
}

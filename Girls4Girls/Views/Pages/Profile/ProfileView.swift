//
//  ProfileView.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 24/3/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var loginData = UserStateViewModel()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {

                    VStack {
                        Text("Привет team6")
                            .font(.custom(FontsManager.Mulish.semiBold, size: 20))
                            .frame(width: 360, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color.theme.darkPurple)
                        HStack {
                            Image("profileImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("team6")
                                    .font(.custom(FontsManager.Mulish.semiBold, size: 16))
                                    .foregroundColor(Color.theme.darkPurple)
                                
                                Text("Пол: М")
                                    .font(.custom(FontsManager.Mulish.regular, size: 16))
                                    .foregroundColor(Color.theme.darkGray)
                                
//                                let dateString = userVM.date_of_birth
//                                let date = ISO8601DateFormatter().date(from: dateString)
//                                let formattedBD = dateFormatter.string(from: date ?? Date())
                                
//                                Text("Дата рождения: \(formattedBD)")
//                                    .foregroundColor(Color.theme.darkGray)
                                
                                Text("Регион: Бишкек")
                                    .font(.custom(FontsManager.Mulish.regular, size: 16))
                                    .foregroundColor(Color.theme.darkGray)
                            }
                            
                            Spacer()
                        }
                        .padding(.top, 15)
                        
                        // Custom Navigation Links
                        CustomNavigationLink(image: "edit", title: "Редактировать профиль") {
                            EditProfileView()
                        }
                        
                        CustomNavigationLink(image: "myApplications", title: "Мои заявки") {
                            MyApplicationsView()
                        }
                        
                        CustomNavigationLink(image: "watchedVideo", title: "Мои просмотренные видео") {
                            MyVideosView()
                        }
                        
                        CustomNavigationLink(image: "tasks", title: "Мои тесты ") {
                            MyTasksView()
                        }
                        
                        CustomNavigationLink(image: "heartProfile", title: "Мои избранные видео") {
                            MyVideosView()
                        }
                        
                        CustomNavigationLink(image: "crown", title: "Мои достижения") {
                            MyRewardsView()
                        }
                        
                        CustomNavigationLink(image: "redo", title: "Обратная связь") {
                            ContactView()
                        }
                        
                        Button {
                            loginData.signOutJWT()
                            guard let window = UIApplication.shared.windows.first else { return }
                            let viewModel = UserStateViewModel()
                            window.rootViewController = UIHostingController(rootView: MainSignIn().environmentObject(viewModel))
                        } label: {
                            Text("Выйти")
                                .fontWeight(.semibold)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color.white)
                                .background(Color.theme.purple)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                                .padding(.top, 10)
                        }
                        .padding(.vertical, 20)
                        
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 60)
                .padding(.horizontal, 20)
            }
            .themeGradient()
            HeaderView(title: "Личный кабинет")
                .themeGradient()
        }
        .navigationBarHidden(true)
    }
    
    // Avoiding new structs
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(image: String, title: String, @ViewBuilder content: @escaping () -> Detail) -> some View {
        
        NavigationLink {
            content()
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                
                Text(title)
                    .font(.custom(FontsManager.Mulish.bold, size: 16))
                    .foregroundColor(Color.theme.purple)
                    .fontWeight(.semibold)
                
                Spacer()
                
            }
            .foregroundColor(.black)
            .padding()
            .background(
                Color.white
                    .cornerRadius(12)
            )
            
            .padding(.top, 10)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

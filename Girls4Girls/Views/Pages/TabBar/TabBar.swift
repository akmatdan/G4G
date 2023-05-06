//
//  TabBar.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 24/2/23.
//

import SwiftUI

struct TabBar: View {
    
    @State var currentTab: Tab = .Main
    @State private var isApplicationSheetPresented = false
    @StateObject var loginData =  UserStateViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            TabView(selection: $currentTab) {
                
                MainView()
                    .tag(Tab.Main)
                
                MentorshipView()
                    .tag(Tab.Mentorship)
                
                ApplicationView()
                    .tag(Tab.Application)
                
                Videoblog()
                    .tag(Tab.Videoblog)
                
                if let token = UserDefaults.standard.string(forKey: "accessToken") {
                    ProfileView()
                        .tag(Tab.ProfileView)
                        .onAppear() {
                            print("Is authenticated: true")
                        }
                } else {
                    AnonymusProfileView()
                        .tag(Tab.ProfileView)
                        .onAppear() {
                            print("Is authenticated: false")
                        }
                }
            }
            
            HStack(spacing: -15) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        currentTab = tab
                    } label: {
                        VStack {
                            Image(String(tab.rawValue))
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(currentTab == tab ? Color.theme.darkPurple : Color.black.opacity(0.3))
                            
                            Text(tab.title)
                                .font(.custom(FontsManager.Mulish.light, size: 10))
                                .frame(width: 60)
                                .font(.caption)
                                .foregroundColor(currentTab == tab ? Color.theme.darkPurple : Color.black.opacity(0.3))
                        }
                    }
                }
                .padding([.horizontal, .top])
                
            }
        }
    }
}

// Tab cases, Iterable
enum Tab: String, CaseIterable {
    
    // Raw Value Image name in asset
    case Main = "home"
    
    case Mentorship = "mentorship"
    
    case Application = "application"
    
    case Videoblog = "videoblog"
    
    case ProfileView = "profile"
    
    // Title for each tab
    var title: String {
        switch self {
        case .Main:
            return "Главная"
        case .Mentorship:
            return "Менторство"
        case .Application:
            return "Программы"
        case .Videoblog:
            return "Видеоблог"
        case .ProfileView:
            return "Профиль"
        }
    }
}
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}


//struct ApplicationPopupView: View {
//
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 20) {
//                ZStack {
//                    NavigationLink(destination: ApplicationView()) {
//                        HStack {
//                            Image("applic")
//                                .resizable()
//                                .renderingMode(.template)
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 24, height: 24)
//
//                            Text("Тренинги")
//                        }
//                        .frame(width: 350, alignment: .leading)
//                    }
//                }
//                .edgesIgnoringSafeArea(.all)
//
//                Divider()
//
//                NavigationLink(destination: ForumsView()) {
//                    HStack {
//                        Image("global")
//                            .resizable()
//                            .renderingMode(.template)
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 24, height: 24)
//
//                        Text("Форумы")
//                    }
//                    .frame(width: 350, alignment: .leading)
//                }
//            }
//        }
//        .navigationBarHidden(true)
//    }
//}


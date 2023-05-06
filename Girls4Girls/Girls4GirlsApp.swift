//
//  Girls4GirlsApp.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 18/2/23.
//

import SwiftUI
//import Firebase
//import GoogleSignIn

@main
struct Girls4GirlsApp: App {
    
    // Log status
    @StateObject var loginData: UserStateViewModel = UserStateViewModel()
    
//    @State var show = false
//    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//    @AppStorage("signIn") var isSignIn = false
//    @StateObject var appEnvironment = AppEnvironment()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                VStack {
                    if let token = UserDefaults.standard.string(forKey: "accessToken") {
                        TabBar()
//                            .environmentObject(appEnvironment)
                    } else {
                        ContentView()
//                            .environmentObject(appEnvironment)
                    }
                }
//                .onAppear {
//                    NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
//
//                        self.status = UserDefaults.standard.value(forKey: "signIn") as? Bool ?? false
//                    }
//                }
            }
        }
    }
}


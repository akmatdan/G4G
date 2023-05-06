//
//  FacebookAuth.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 10/3/23.
//
//
//import Foundation
//import SwiftUI
//import FacebookLogin
//import Firebase
//
//struct FacebookAuth: UIViewRepresentable {
//    
//    func makeCoordinator() -> FacebookAuth.Coordinator {
//        return FacebookAuth.Coordinator()
//    }
//    
//    func makeUIView(context: Context) -> FBLoginButton {
//        let button = FBLoginButton()
//        button.permissions = ["public_profile", "email"]
//        button.delegate = context.coordinator
//        return button
//    }
//    
//    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<FacebookAuth>) {
//    }
//    
//    class Coordinator: NSObject, LoginButtonDelegate {
//        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
//            
//            if error != nil {
//                print((error?.localizedDescription)!)
//                return
//            }
//            
//            if AccessToken.current != nil {
//                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
//                
//                Auth.auth().signIn(with: credential) { (result, error) in
//                    
//                    if error != nil {
//                        print((error?.localizedDescription)!)
//                        return
//                    }
//                    print("Success")
//                }
//            }
//        }
//        
//        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
//            try! Auth.auth().signOut()
//        }
//    }
//}

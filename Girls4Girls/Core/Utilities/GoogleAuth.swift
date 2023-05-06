//
//  GoogleAuth.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 9/3/23.
//

/*
import Foundation
import FirebaseAuth
import GoogleSignIn
import Firebase

struct GoogleAuth {
    static let share = GoogleAuth()
    
    init() {}
    
    func signinWithGoogle(presenting: UIViewController,
                          completion: @escaping (Error?) -> Void) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
    GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { signResult, error in
                
        if let error = error {
            completion(error)
           return
        }
                
         guard let user = signResult?.user,
               let idToken = user.idToken else { return }
         
         let accessToken = user.accessToken
                
         let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)

            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    completion(error)
                    return
                }
                print("SIGN IN")
                UserDefaults.standard.set(true, forKey: "signIn") // When this change to true, it will go to the home screen
            }
        }
    }
    
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        

        return root
    }
}
*/

//
//  LoginViewModel.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 21/2/23.
//

import SwiftUI
//import FirebaseAuth
//import Firebase
//import GoogleSignIn
import Combine
import Alamofire

class UserStateViewModel: ObservableObject {
    
//    let auth = Auth.auth()
    
    // Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var password_confirm: String = ""
    @Published var showConfirmPassword: Bool = false
    
    // Register
    @Published var first_name: String = ""
    @Published var last_name: String = ""
    @Published var registerUser: Bool = false
    @Published var gender: String?
    @Published var region: String?
    @Published var city: String?
    @Published var date_of_birth: String? = String(Calendar.current.dateComponents([.year], from: Date()).year!)
    @Published var phone_number: String = ""
    @Published var profile_picture: String = ""
    @Published var district: String = ""
    @Published var FL_name: String = ""
    
    @Published var event: String = ""
    @Published var eventID: Int?
    @Published var resume: String?
    @Published var status: String?
    @Published var answers: [String : String]?
    
    // change password
    @Published var old_password: String = ""
    @Published var new_password: String = ""
    @Published var confirm_new_password: String = ""
    
    @Published var isLoggedIn: Bool = false
    @Published var loginStatusMessage: String = ""
    @Published var emtyVar: String = ""
    
    @Published var isAuthenticated: Bool = false
    @Published var showIncorrectCredentialsAlert = false
    
    @Published var userCallBackText: String = ""
    @State var alert = false

    // register JWT
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    private var cancellable: AnyCancellable?
    
    @Published var userDetails: CurrentUser?
    @Published var error: String = ""
    
    // JWT
    func logIn() {
        let defaults = UserDefaults.standard
        Webservice().login(email: email, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "accessToken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                    print("Authenticated")
                }
            case .failure(let error):
                self.showIncorrectCredentialsAlert = true
                print(error.localizedDescription)
            }
        }
    }

    
    func changePassword() {
        let defaults = UserDefaults.standard
        Webservice().changePassword(old_password: old_password, new_password: new_password, confirm_new_password: confirm_new_password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "accessToken")
                DispatchQueue.main.async {
                    print("Password changed")
                }
            case .failure(let error):
                self.showIncorrectCredentialsAlert = true
                print(error.localizedDescription)
            }
        }
    }
    
    func signOutJWT() {
       let defaults = UserDefaults.standard
       defaults.removeObject(forKey: "accessToken")
       DispatchQueue.main.async {
           self.isAuthenticated = false
           print("Not Authenticated")
       }
   }
    
//    var isSignedIn: Bool {
//        return auth.currentUser != nil
//    }
    
    func ForgotPassword() {
        
    }
    
//    func signOutGoogle() {
//        try? auth.signOut()
//        UserDefaults.standard.set(false, forKey: "signIn")
//        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//        print("is Signed Out")
//    }
    
    func registerJWT() {
        self.isLoading = true
        let webservice = Webservice()
        webservice.registerUser(email: email, password: password, password_confirm: password_confirm, first_name: first_name, last_name: last_name) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let token):
                    print("Registration successful, token: \(token)")
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func reset() {
        if email != "" {
            Webservice().resetPassword(email: self.email) { result in
                    switch result {
                    case .success(_):
                        DispatchQueue.main.async {
                            print("Password reset")
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            } else {
                self.error = "Please enter your email and try again."
                self.alert.toggle()
            }
    }
    /*
    func verify() {
        
        if email != "" && password != "" {
            Auth.auth().signIn(withEmail: email, password: password) { res, err in
                
                if err != nil {
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("Success")
//                UserDefaults.standard.set(true, forKey: "status")
//                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        } else {
            self.error = "Пожалуйста заполните все поля."
            self.alert.toggle()
        }
    }
     */
    
    // MARK: - Validation Functions
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$")
        return passwordTest.evaluate(with: password)
    }
    
    func passwordMatch() -> Bool {
        password == password_confirm
    }
    
//    func isValidAge() -> Bool {
//        String((Calendar.current.dateComponents([.year], from: Date()).year! - date_of_birth) >= 7)
//    }
    
    func isNameValid() -> Bool {
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", "^([1-zA-Z0-1@.\\s]{1,25})$")
        return userNameTest.evaluate(with: first_name)
    }
    
    func isSureNameValid() -> Bool {
        let sureNameTest = NSPredicate(format: "SELF MATCHES %@", "^([1-zA-Z0-1@.\\s]{1,25})$")
        return sureNameTest.evaluate(with: last_name)
    }
    
    func clearSignUp() {
        registerUser = false
        first_name = ""
        last_name = ""
        password_confirm = ""
        showConfirmPassword = false
        date_of_birth = String(Calendar.current.dateComponents([.year], from: Date()).year!)
    }
    
    // MARK: - Validation Prompt Strings
    
    var confirmPasswordPromt: String {
        if passwordMatch() {
            return ""
        } else {
            return "Пароли не совпадают"
        }
    }
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Введите верный email"
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Пароль должен содержать минимум 8 символов, из букв, цифр и одного специального знака."
        }
    }
    
//    var agePrompt: String {
//        if isValidAge() {
//            return ""
//        } else {
//            return "Год рождения (старше 7 лет)"
//        }
//    }
    
    var namePrompt: String {
        if isNameValid() {
            return ""
        } else {
            return "Заполните Имя"
        }
    }
    
    var sureNamePrompt: String {
        if isSureNameValid() {
            return ""
        } else {
            return "Заполните Фамилию"
        }
    }
}





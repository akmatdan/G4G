//
//  FormViewModel.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 22/4/23.
//

import Alamofire

class FormViewModel: ObservableObject {
    
    // MARK: - Properties
    
    var event: Int = 4
    var user: Int = 23
    var name: String = ""
    var email: String = ""
    var phone: String = ""
    var date_of_births: String = ""
    var region: String = ""
    var city: String = ""
    var answers: [String: String] = [:]
    
    let refreshTokenURL = "http://34.89.133.245/ru/api/auth/token/refresh/"
    
    // MARK: - Helper Methods
    
    func registerForm(eventId: Int) {
        // Refresh the access token first
        refreshAccessToken { accessToken, error in
            if let accessToken = accessToken {
                // Call the registerUserEvent function with the new access token
                self.registerUserEvent(using: accessToken, eventId: eventId)
            } else {
                // Handle the error
                print(error?.localizedDescription ?? "Unknown error")
            }
        }
    }
    
    func refreshAccessToken(completion: @escaping (String?, Error?) -> Void) {
        let defaults = UserDefaults.standard
        guard let refresh = defaults.string(forKey: "refresh") else {
            completion(nil, NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "Refresh token not found in UserDefaults"]))
            return
        }
        
        let url = URL(string: refreshTokenURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["refresh": refresh]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let accessToken = json["accessToken"] as? String {
                        // Store the new access token in UserDefaults
                        defaults.set("accessToken", forKey: "accessToken")
                        completion(accessToken, nil)
                    } else {
                        completion(nil, NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response from server"]))
                    }
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, NSError(domain: "com.example.app", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response from server"]))
            }
        }
        task.resume()
    }
    
    func registerUserEvent(using accessToken: String, eventId: Int) {
        let parameters: [String: Any] = [
            "event": eventId,
            "user": user,
            "name": name,
            "email": email,
            "phone": phone,
            "date_of_birth": date_of_births,
            "region": region,
            "city": city,
            "answers": answers
        ]
        
        print(accessToken)
        let defaults = UserDefaults.standard
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(defaults.string(forKey: "accessToken") ?? "")"
        ]
        
        AF.request("http://34.89.133.245/ru/api/registrations/",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                // Handle success response
            case .failure(let error):
                print(error.localizedDescription)
                // Handle error response
            }
        }
    }
}

//
//  Webservice.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 23/3/23.
//

import Foundation
import SwiftUI
import SwiftyJSON
import Alamofire

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(erromessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}

struct RegisterRequestBody: Codable {
    let email: String
    let password: String
    let password_confirm: String
    let first_name: String
    let last_name: String
}

struct ResetPasswordBody: Codable {
    let email: String
}

struct ChangePassworodBody: Codable {
    let old_password: String
    let new_password: String
    let confirm_new_password: String
}

struct RegisterFormBody: Codable {
    let event: Int
    let user: Int
    let name: String
    let email: String
    let phone: String
    let date_of_birth: String?
    let region: String?
    let city: String?
    let resume: String?
    let status: String?
    let answers: [String?: String?]
}

// Response
struct LoginResponse: Codable {
    let access: String?
    let refresh: String?
    let success: Bool?
}

struct ResetPasswordResponse: Codable {
    let success: Bool?
}

struct ChangePassworodResponse: Codable {
    let access: String?
    let success: Bool?
}

class Webservice {
    
    func login(email: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://34.89.133.245/ru/api/auth/login/") else {
            completion(.failure(.custom(erromessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { ( data, response, error )in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(erromessage: "No data")))
                 return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let accessToken = loginResponse.access else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let refreshToken = loginResponse.refresh else {
                completion(.failure(.invalidCredentials))
                return
            }
            UserDefaults.standard.set(refreshToken, forKey: "refreshToken")
            completion(.success(accessToken))
        }.resume()
    }
    
    func registerUser(email: String, password: String, password_confirm: String, first_name: String, last_name: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "http://34.89.133.245/ru/api/auth/register/") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        let body = RegisterRequestBody(email: email, password: password, password_confirm: password_confirm, first_name: first_name, last_name: last_name)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(body) else {
            completion(.failure(NetworkError.decodingError))
            return
        }

        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.decodingError))
                return
            }

            if (200...299).contains(httpResponse.statusCode) {
                if let token = String(data: data, encoding: .utf8) {
                    completion(.success(token))
                } else {
                    completion(.failure(NetworkError.decodingError))
                }
            } else {
                if let errorMessage = String(data: data, encoding: .utf8) {
                    completion(.failure(AuthenticationError.custom(erromessage: errorMessage)))
                } else {
                    completion(.failure(NetworkError.decodingError))
                }
            }
        }.resume()
    }
    
    func resetPassword(email: String, completion: @escaping (Result<ResetPasswordResponse, Error>) -> Void) {
        guard let url = URL(string: "http://34.89.133.245/api/auth/password_reset/") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let body = ResetPasswordBody(email: email)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NetworkError.noData))
                return
            }
            
            guard let resetPasswordResponse = try? JSONDecoder().decode(ResetPasswordResponse.self, from: data) else {
                completion(.failure(NetworkError.decodingError))
                return
            }
            
            completion(.success(resetPasswordResponse))
        }.resume()
    }
    
    func changePassword(old_password: String, new_password: String, confirm_new_password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://34.89.133.245/api/auth/change-password/") else {
            completion(.failure(.custom(erromessage: "URL is not correct")))
            return
        }
        
        let body = ChangePassworodBody(old_password: old_password, new_password: new_password, confirm_new_password: confirm_new_password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { ( data, response, error )in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(erromessage: "No data")))
                 return
            }
            
            guard let changePassworodResponse = try? JSONDecoder().decode(ChangePassworodResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = changePassworodResponse.access else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
        }
        .resume()
    }
    
}

//
//  NetworkViewModel.swift
//  Girls4Girls
//
//  Created by Daniil Akmatov on 27/3/23.
//

import Foundation

enum APIEndpoint {
    
    case eventsQuestions
    case news
    case events
    case mentors
    case menty
    case pastEvents
    case tranings
    case forums
    case videoBlog
    case mentorships
    
    var urlString: String {
        switch self {
        case .eventsQuestions:
            return "http://34.89.133.245/ru/api/questions/"
        case .mentorships:
            return "http://34.89.133.245/ru/api/events/mentorship/"
        case .news:
            return "http://34.89.133.245/api/content/news/"
        case .events:
            return "http://34.89.133.245/api/events/"
        case .mentors:
            return "http://34.89.133.245/ru/api/content/mentors/"
        case .menty:
            return "http://34.89.133.245/ru/api/content/participants/"
        case .pastEvents:
            return "http://34.89.133.245/ru/api/past_trainings/"
        case .forums:
            return "http://34.89.133.245/ru/api/events/forums/"
        case .tranings:
            return "http://34.89.133.245/ru/api/events/trainings/"
        case .videoBlog:
            return "http://34.89.133.245/ru/api/videos/"
        }
    }
}

final class NetworkViewModel: ObservableObject {
    
    @Published var eventsQuestions: [EventsQuestions] = []
    @Published var mentorships: [Mentorships] = []
    @Published var news: [News] = []
    @Published var events: [Event] = []
    @Published var mentors: [Mentor] = []
    @Published var menty: [Menty] = []
    @Published var pastEvents: [PastEvents] = []
    @Published var forums: [Forum] = []
    @Published var tranings: [Traning] = []
    @Published var videoBlog: [Videos] = []
    
    @Published var hasError = false
    @Published var error: EventError?
    
    func fetchData(for endpoint: APIEndpoint) {

        hasError = false

        if let url = URL(string: endpoint.urlString) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                
                DispatchQueue.main.async {
                    if let error = error {
                        self?.hasError = true
                        self?.error = EventError.custom(error: error)
                    } else {
                        let decoder = JSONDecoder()
                        if let data = data {
                            switch endpoint {
                            case .eventsQuestions:
                                if let eventsQuestion = try? decoder.decode([EventsQuestions].self, from: data) {
                                    self?.eventsQuestions = eventsQuestion
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            case .mentorships:
                                if let mentorships = try? decoder.decode([Mentorships].self, from: data) {
                                    self?.mentorships = mentorships
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            case .news:
                                if let news = try? decoder.decode([News].self, from: data) {
                                    self?.news = news
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            case .events:
                                if let events = try? decoder.decode([Event].self, from: data) {
                                    self?.events = events
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            case .mentors:
                                if let mentors = try? decoder.decode([Mentor].self, from: data) {
                                    self?.mentors = mentors
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            case .menty:
                                if let menties = try? decoder.decode([Menty].self, from: data) {
                                    self?.menty = menties
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            case .pastEvents:
                                if let pastEvents = try? decoder.decode([PastEvents].self, from: data) {
                                    self?.pastEvents = pastEvents
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            case .forums:
                                if let forums = try? decoder.decode([Forum].self, from: data) {
                                    self?.forums = forums
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            case .tranings:
                                if let tranings = try? decoder.decode([Traning].self, from: data) {
                                    self?.tranings = tranings
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            case .videoBlog:
                                if let videoBlog = try? decoder.decode([Videos].self, from: data) {
                                    self?.videoBlog = videoBlog
                                } else {
                                    self?.hasError = true
                                    self?.error = EventError.failedToDecode
                                }
                            }
                        }
                    }
                }
            }.resume()
        }
    }
}

extension NetworkViewModel {
    enum EventError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        
        var errorDescription: String? {
            switch self {
            case .custom(let error):
                return error.localizedDescription
            case .failedToDecode:
                return "Faild to decode response"
            }
        }
    }
}

//
//  APIClient.swift
//  HoroscopeProject
//
//  Created by Oscar Victoria Gonzalez  on 1/13/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation
import NetworkHelper

struct HoroscopeAPIClient {
    static func getHoroscopes(horoscope: String,completion: @escaping (Result <Horoscopes, AppError>)-> ()) {
        
        let horoscope = horoscope.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "libra"
        
        let endpointURLString = "http://sandipbgt.com/theastrologer/api/horoscope/\(horoscope)/today/"
        
        guard let url = URL(string: endpointURLString) else {
            completion(.failure(.badURL(endpointURLString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let sign = try JSONDecoder().decode(Horoscopes.self, from: data)
                    completion(.success(sign))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
}

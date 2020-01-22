//
//  HoroscopeAPIClient.swift
//  UpdatedHoroscopeLab
//
//  Created by Yuliia Engman on 1/22/20.
//  Copyright © 2020 Yuliia Engman. All rights reserved.
//

import Foundation

struct HoroscopeAPIClient {
    static func fetchHoroscope(for sunsign: String,
                            completion: @escaping (Result<Horoscope, AppError>) -> ()) {
        
        let horoscopeEndpointURL = "http://sandipbgt.com/theastrologer/api/horoscope/\(sunsign)/today"
        
        guard let url = URL(string: horoscopeEndpointURL) else {
            completion(.failure(.badURL(horoscopeEndpointURL)))
            return
        }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) {(result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let horoscopeResult = try JSONDecoder().decode(Horoscope.self, from: data)
                    completion(.success(horoscopeResult))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}

//
//  WebService.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 06/09/21.
//

import Foundation
import Combine

protocol WebService {
    func getNewsList() -> AnyPublisher<News, Error>?
}

class WebServiceBase: WebService {
    func getNewsList() -> AnyPublisher<News, Error>? {
        guard let url = URL(string: AppConstants.APIEndpoints.newsList) else { return nil }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ result in
                guard let response = result.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    print("Response error is received")
                    throw URLError(.badServerResponse)
                }
                return result.data
            })
            .decode(type: News.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

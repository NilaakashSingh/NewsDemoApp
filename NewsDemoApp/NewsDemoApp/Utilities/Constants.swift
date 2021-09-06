//
//  Constants.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 05/09/21.
//

import Foundation

struct AppConstants {
    
    private struct AccessToken {
        static let string = "Your access token here"
    }
    
    struct APIEndpoints {
        static let newsList = "https://newsapi.org/v2/everything?q=apple&sortBy=publishedAt&apiKey=" + AccessToken.string
    }
}

enum NetworkError: Error {
    case badURL, requestFailed, unknown, badServerResponse
}

//
//  Constants.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 05/09/21.
//

import Foundation

struct AppConstants {
    
    private struct AccessToken {
        static let string = "Your Access Token here"
    }
    
    struct APIEndpoints {
        static let newsList = "https://newsapi.org/v2/everything?q=apple&from=2021-08-05&sortBy=publishedAt&apiKey=" + AccessToken.string
    }
}

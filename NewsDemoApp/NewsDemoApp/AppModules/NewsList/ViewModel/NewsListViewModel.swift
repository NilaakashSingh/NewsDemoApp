//
//  NewsListViewModel.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 05/09/21.
//

import Combine
import Foundation

class NewsListViewModel: ObservableObject {
    // MARK: - Variables
    @Published private(set) var showProgressView = false
    @Published private(set) var articles = [Article]()
    var newsListCancellable: AnyCancellable?
    
    // MARK: - Utility Methods
    func newsList() -> [Article] {
        return articles
    }
}

// MARK: - API methods
extension NewsListViewModel {
    func getNewsList() {
        showProgressView = true
        guard let url = URL(string: AppConstants.APIEndpoints.newsList) else {
            showProgressView = false
            return
        }
        newsListCancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ result in
                guard let response = result.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    print("Response error is received")
                    self.showProgressView = false
                    throw URLError(.badServerResponse)
                }
                return result.data
            })
            .decode(type: News.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {_ in }, receiveValue: { news in
                if let articles = news.articles {
                    self.articles = articles
                }
                self.showProgressView = false
            })
    }
}

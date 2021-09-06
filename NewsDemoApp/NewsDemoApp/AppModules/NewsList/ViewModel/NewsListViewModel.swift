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
    var webService: WebService
    
    init(webService: WebService = WebServiceBase()) {
        self.webService = webService
    }
    
    // MARK: - Utility Methods
    func newsList() -> [Article] {
        return articles
    }
}

// MARK: - API methods
extension NewsListViewModel {
    func getNewsList(completion: @escaping (Result<Bool, Error>) -> Void) {
        showProgressView = true
        newsListCancellable = webService.getNewsList()?
            .mapError({ (error) -> Error in
                print(error)
                completion(.failure(error))
                self.showProgressView = false
                return error
            })
            .sink(receiveCompletion: {_ in }, receiveValue: { news in
                if let articles = news.articles {
                    self.articles = articles
                }
                self.showProgressView = false
                completion(.success(true))
            })
    }
}

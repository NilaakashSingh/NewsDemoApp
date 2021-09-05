//
//  News.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 05/09/21.
//

import Foundation

// MARK: - News
struct News: Codable {
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable, Hashable {
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    let source: Source?
    
    func formattedPublishedDate() -> String? {
        let dateFormatter = DateFormatter()
        guard let publishedAt = self.publishedAt else { return nil }
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let publishedDate = dateFormatter.date(from: publishedAt)
        guard let formattedDate = publishedDate else { return nil }
        dateFormatter.dateFormat = "dd MMM yyy, hh:mm a"
        return dateFormatter.string(from: formattedDate)
    }
}

// MARK: - Source
struct Source: Codable, Hashable {
    let id: String?
    let name: String?
}

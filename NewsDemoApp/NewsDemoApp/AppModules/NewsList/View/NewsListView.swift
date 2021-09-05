//
//  NewsListView.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 05/09/21.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject private var viewModel = NewsListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.newsList(), id: \.self) { article in
                    NavigationLink(
                        destination: NewsDetailView(article: article),
                        label: {
                            NewsCell(title: article.title,
                                     urlToImage: article.urlToImage,
                                     publishedAt: article.formattedPublishedDate())
                        })
                }
            }
            .navigationTitle("News")
            .onFirstAppear {
                viewModel.getNewsList()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

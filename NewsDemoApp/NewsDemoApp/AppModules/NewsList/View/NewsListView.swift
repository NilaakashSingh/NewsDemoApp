//
//  NewsListView.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 05/09/21.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject private var viewModel = NewsListViewModel()
    @State private var showErrorAlert = false
    @State private var error = NetworkError.unknown
    
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
                viewModel.getNewsList(completion: { result in
                    switch result {
                    case .failure(let error):
                        showErrorAlert = true
                        self.error = error
                    default:
                        print("We can also handle success case with received value")
                    }
                    
                })
            }
            .alert(isPresented: $showErrorAlert, content: {
                Alert(title: Text("Error Occured"),
                      message: Text(error.localizedDescription),
                      dismissButton:.cancel())
            })
        }
        
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

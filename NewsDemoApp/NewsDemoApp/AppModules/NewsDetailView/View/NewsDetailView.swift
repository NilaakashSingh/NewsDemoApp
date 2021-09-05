//
//  NewsDetailView.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 05/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailView: View {
    
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack {
                WebImage(url: URL(string: article.urlToImage ?? .empty))
                    .resizable()
                    .placeholder(Image("noImageFound"))
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(height: 400,
                           alignment: .center)
                VStack(alignment: .leading) {
                    contentBody
                    sourceBody
                }
                .padding([.leading, .trailing])
               
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private var contentBody: some View {
        VStack(alignment: .leading) {
            Text(article.title ?? .empty)
                .font(.title2)
            if let author = article.author {
                HStack {
                    Spacer()
                    Text("By: \(author)")
                        .font(.subheadline)
                }
                .padding(.top, 5)
            }
            
            Text(article.description ?? .empty)
                .font(.body)
                .padding(.top)
        }
        .padding(.top)
    }
    
    private var sourceBody: some View {
        VStack(alignment: .leading) {
            Text("Source: \(article.source?.name ?? .empty)")
            HStack(alignment: .top) {
                Text("Read More:")
                    .foregroundColor(.white)
                Button(action: { openURL(urlString: article.url) },
                       label: { Text(article.url ?? .empty) })
            }
            .padding(.top, 5)
        }
        .padding(.top)
    }
    
    private func openURL(urlString: String?) {
        if let url = URL(string: urlString ?? .empty) {
            UIApplication.shared.open(url)
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    private static let article = Article(author: "Jon Fingas", title: "Germany wants phone makers to offer 7 years of security updates", description: "Your current phone might get security patches for several years to come, at least if Germany has its way. C'treports the German federal government is pushing the European Union to require seven years of security updates and spare parts for smartphones as part…", url: "https://www.engadget.com/germany-phone-makers-7-years-security-updates-163601435.html", urlToImage: "https://s.yimg.com/os/creatr-uploaded-images/2021-09/7c269990-0d97-11ec-bf2f-32fb211ca9fb", publishedAt: "2021-09-04T16:36:01Z", content: "Your current phone might get security patches for several years to come, at least if Germany has its way. C'treports the German federal government is pushing the European Union to require seven years… [+1763 chars]", source: Source(id: "Engadget", name: "Engadget"))
    
    static var previews: some View {
        NewsDetailView(article: article)
    }
}

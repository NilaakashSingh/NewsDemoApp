//
//  NewsCell.swift
//  NewsDemoApp
//
//  Created by Nilaakash Singh on 05/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsCell: View {
    
    let title: String?
    let urlToImage: String?
    let publishedAt: String?
    
    // NOTE: I can also add if let her to unwrap all the above parameters.
    var body: some View {
        HStack {
            WebImage(url: URL(string: urlToImage ?? .empty))
                .resizable()
                .placeholder(Image("noImageFound"))
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 100,
                       height: 100,
                       alignment: .center)
            
            VStack {
                Text(title ?? .empty)
                    .font(.subheadline)
                Text("Published: \(publishedAt ?? .empty )")
                    .font(.footnote)
            }
            .padding(.top, 5)
            .padding(.leading)
        }
        .padding([.leading, .trailing])
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(title: "Germany wants phone makers to offer 7 years of security updates",
                 urlToImage: "https://s.yimg.com/os/creatr-uploaded-images/2021-09/7c269990-0d97-11ec-bf2f-32fb211ca9fb",
                 publishedAt: "5 Sep 2021, 6.15 pm")
    }
}

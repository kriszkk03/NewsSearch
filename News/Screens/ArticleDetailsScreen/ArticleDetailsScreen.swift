//
//  ArticleDetailsScreen.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 19..
//

import SwiftUI

struct ArticleDetailsScreen: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack {
                Text(article.title)
                    .font(.title)
                AsyncImage(url: URL(string: article.urlToImage)) { image in
                    if let img = image.image {
                        img
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 10)
                    }
                }
                Text(article.description)
            }
        }
    }
}

struct ArticleDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsScreen(article: SearchResult.sampleData.articles[0])
    }
}

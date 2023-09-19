//
//  ArticleCard.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 19..
//

import SwiftUI

struct ArticleCardView: View {
    @Binding var article: Article
        
    var body: some View {
        VStack {
            if let title = article.title {
                Text(title)
                    .font(.title)
                    .foregroundColor(Theme.orange.accentColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
            }
            if let description = article.description {
                Text(description)
                    .font(.caption)
                    .foregroundColor(Theme.orange.accentColor)

                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(6.0)
        .background(Color.white)
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(article: .constant(SearchResult.sampleData.articles[0]))
    }
}

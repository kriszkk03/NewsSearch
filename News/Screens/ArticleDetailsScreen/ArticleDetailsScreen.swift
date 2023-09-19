//
//  ArticleDetailsScreen.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 19..
//

import SwiftUI

struct ArticleDetailsScreen: View {
    @Binding var article: Article
    
    var body: some View {
        Text(article.title)
    }
}

struct ArticleDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsScreen(article: .constant(SearchResult.sampleData.articles[0]))
    }
}

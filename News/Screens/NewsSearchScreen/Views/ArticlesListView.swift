//
//  ArticlesListView.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 19..
//

import SwiftUI

struct ArticlesListView: View {
    @Binding var searchText: String
    @Binding var searchResults: [Article]
    
    // AsyncImage!!
    
    var body: some View {
            ScrollView {
                LazyVStack {
                    Section(header: Text("Results for: \(searchText)")) {
                        if let articles = searchResults {
                            ForEach(articles) { article in
                                NavigationLink(destination: ArticleDetailsScreen(article: (article))) {
                                    ArticleCardView(article: .constant(article))
                                }
                            }
                        }
                        
                    }
                }
            }
            .padding()
            .background(Theme.orange.mainColor)
    }
}

struct ArticlesListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView(searchText: .constant("IOS"), searchResults: .constant(SearchResult.sampleData.articles))
    }
}

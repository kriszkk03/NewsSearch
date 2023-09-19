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

    func pr() {
        print(searchResults[0])
        print(searchResults[1])
        print($searchResults[2])
    }
    
//    @State private var currentPage = 1
//
//    var totalPages: Int {
//        (searchResults.count + 15 - 1) / 15
//    }
////
//    var paginatedItems: [Int] {
//        let startIndex = (currentPage - 1) * 15
//        let endIndex = min(startIndex + 15, searchResults.count)
//        return searchResults[startIndex...endIndex]
//    }
//
//
//    func loadMoreContent(_ item: Article){
//        let thresholdIndex = searchResults.index(searchResults.endIndex, offsetBy: -1)
//        if thresholdIndex == Int(item.id!), (currentPage + 1) <= totalPages {
//            currentPage += 1
//        }
//    }
//    func loadNextPageIfNeeded() {
//        if currentPage < totalPages {
//            currentPage += 1
//        }
//    }
    
    // AsyncImage!!
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    Button(action: pr) {
                        Text("Tap")
                    }
                    Section(header: Text("Results for: \(searchText)")) {
                        if let articles = searchResults {
                            ForEach(articles) { article in
                                NavigationLink(destination: ArticleDetailsScreen(article: .constant(article))) {
                                    ArticleCardView(article: .constant(article))
                                }
                            }
                        }
                        
                    }
                }
            }
            .padding()
            .background(Color.green)
        }
    }
}

struct ArticlesListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView(searchText: .constant("IOS"), searchResults: .constant(SearchResult.sampleData.articles))
    }
}

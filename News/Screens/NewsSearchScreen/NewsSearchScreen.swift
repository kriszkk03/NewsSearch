//
//  NewsSearchScreen.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 18..
//

import SwiftUI

struct NewsSearchScreen: View {
    @State private var searchResults: [Article] = []
    @State private var searchText: String = ""


    var body: some View {
        VStack {
            SearchPageTitle()
            ZStack {
                RoundedRectangle(cornerRadius: 4.0)
                    .fill(.orange)
                VStack {
                    SearchBar(searchText: $searchText, searchResults: $searchResults)
                        .padding(.vertical)
                    if searchResults.count > 0 {
                        ArticlesListView(searchText: $searchText, searchResults: $searchResults)
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

struct NewsSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsSearchScreen()
    }
}

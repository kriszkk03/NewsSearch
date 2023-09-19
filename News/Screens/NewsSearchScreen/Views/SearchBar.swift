//
//  SearchBar.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 18..
//

import SwiftUI

enum ApiError: Error {
    case url
    case response
}

struct SearchBar: View {
    @State private var isLoading: Bool = false
    
    @Binding var searchText: String
    @Binding var searchResults: [Article]
    
    
    var body: some View {
        if isLoading == false {
            VStack {
                HStack {
                    TextField("Search", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    Button(action: {
                        Task {
                            do {
                                try await onClickSearch(searchText)
                            } catch {
                                print ("error during fetch news: \(error)")
                            }
                        }
                    }) {
                        Text("Search!")
                        Image(systemName: "arrow.right.circle.fill")
                    }
                }
            }
            .padding()
        } else {
            ProgressView("Loading...")
        }
        
    }
    
    func onClickSearch(_ searchText: String) async throws {
        isLoading = true
        let myApiKey = "c538e24bdaef4d0582e1fee107cef480"
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(searchText)&apiKey=\(myApiKey)") else {
            throw ApiError.url
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let results = try JSONDecoder().decode(SearchResult.self, from: data)
            searchResults = results.articles
            isLoading = false
        } catch {
            print("Error: \(error)")
            isLoading = false
            throw ApiError.response
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("Android"), searchResults: .constant(SearchResult.sampleData.articles))
    }
}

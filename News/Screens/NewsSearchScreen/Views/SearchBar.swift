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

struct APIResponse: Codable {
    let articles: [Article]
}

struct Source: Codable {
    let name: String
}



struct Article: Codable {

    let source: Source

    let title: String

    let description: String?

    let content: String

    let publishedAt: String

    let url: String?

    let urlToImage: String?

}

struct SearchBar: View {
    @State private var searchText = ""
    @State private var searchResults: [String] = []
    
    var body: some View {
        // NavigationView {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                Button(action: {
                    Task {
                        do {
                            try await onClickSearch(searchText)
                            searchText = ""
                        } catch {
                            print ("error during fetch news: \(error)")
                        }
                    }
                }) {
                    Text("Search!")
                    Image(systemName: "arrow.right.circle.fill")
                }
            }
            List(searchResults, id: \.self) { result in
                Text(result)
            }
        }
        .padding()
    }
    
    func onClickSearch(_ searchText: String) async throws {
        print("KATT!")
        searchResults.append(searchText)
        let myApiKey = "c538e24bdaef4d0582e1fee107cef480"
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(searchText)&apiKey=\(myApiKey)") else {
            throw ApiError.url
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let results = try JSONDecoder().decode(APIResponse.self, from: data)
            print(results.articles.count)
            print("MEGHIVODOTT!")
        } catch {
            print("Error: \(error)")
            throw ApiError.response
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}

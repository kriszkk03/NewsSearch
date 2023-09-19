//
//  News.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 18..
//

import Foundation

struct SearchResult: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    init(status: String, totalResults: Int, articles: [Article]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}

extension SearchResult {
    static var emptySearchResult: SearchResult {
        SearchResult(status: "", totalResults: 0, articles: [])
    }
}

extension SearchResult {
    static let sampleData: SearchResult =
        SearchResult(
            status: "asd",
            totalResults: 2,
            articles: [
                Article(id: "1",source: Source(id: nil, name: "sourceName"), author: "Toth Krisztian", title: "This is the preview article", description: "this is a test data for the preview", url: "www.nemmondommeg.hu", urlToImage: "www.eznagytitok.com", publishedAt: "2000-01.01", content: "lorem ipsum!"),
                Article(id: "2",source: Source(id: nil, name: "sourceName2"), author: " author name", title: "This is the preview article2", description: "this is a test data for the preview2", url: "www.nemmondommeg.hu", urlToImage: "www.eznagytitok.com", publishedAt: "2000-01.02", content: "lorem ipsum!"),
                Article(id: "3",source: Source(id: nil, name: "sourceName"), author: "Toth Krisztian", title: "This is the preview article", description: "this is a test data for the preview", url: "www.nemmondommeg.hu", urlToImage: "www.eznagytitok.com", publishedAt: "2000-01.01", content: "lorem ipsum!"),
                Article(id: "4",source: Source(id: nil, name: "sourceName2"), author: " author name", title: "This is the preview article2", description: "this is a test data for the preview2", url: "www.nemmondommeg.hu", urlToImage: "www.eznagytitok.com", publishedAt: "2000-01.02", content: "lorem ipsum!")
            ])
    
}

struct Article:Identifiable, Decodable {
    var id:String? = UUID().uuidString
    var source: Source
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    
    enum CodingKeys: CodingKey {
        case id
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
    
    init(id: String? , source: Source, author: String, title: String, description: String, url: String, urlToImage: String, publishedAt: String, content: String) {
        self.id = id
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID().uuidString
        self.source = try container.decode(Source.self, forKey: .source)
        self.author = try container.decode(String.self, forKey: .author)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.url = try container.decode(String.self, forKey: .url)
        self.urlToImage = try container.decode(String.self, forKey: .urlToImage)
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)
        self.content = try container.decode(String.self, forKey: .content)
    }
}


struct Source: Decodable {
    var id: String?
    var name: String
}

////
////  News.swift
////  News
////
////  Created by Tóth Krisztián on 2023. 09. 18..
////
//
//import Foundation
//
//struct SearchResult: Decodable {
//    let status: String
//    let totalResults: Int
//    public let articles: [Article]
//
//    private enum CodingKeys: String, CodingKey {
//        case status
//        case totalResults
//        case articles
//    }
//
//    init(status: String, totalResults: Int, articles: [Article]) {
//        self.status = status
//        self.totalResults = totalResults
//        self.articles = articles
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        status = try container.decode(String.self, forKey: .status)
//        totalResults = try container.decode(Int.self, forKey: .totalResults)
//        articles = try container.decode([Article].self, forKey: .articles)
//    }
//}
//
//extension SearchResult {
//    static var emptySearchResult: SearchResult {
//        SearchResult(status: "", totalResults: 0, articles: [])
//    }
//}
//
//struct Source: Decodable {
//    var id: String?
//    var name: String
//
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case name
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(String.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//    }
//}
//
//struct Article: Identifiable, Decodable {
//    let id: UUID
//    var source: Source?
//    var author: String?
//    var title: String?
//    var description: String?
//    var url: String?
//    var urlToImage: String?
//    var publishedAt: String?
//    var content: String?
//
//    private enum CodingKeys: String, CodingKey {
//       case source
//       case author
//       case title
//       case description
//       case url
//       case urlToImage
//       case publishedAt
//       case content
//   }
//
//    init(from decoder: Decoder) throws {
//        self.id = UUID()
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        source = try container.decode(Source.self, forKey: .source)
//        author = try container.decode(String.self, forKey: .author)
//        title = try container.decode(String.self, forKey: .title)
//        description = try container.decode(String.self, forKey: .description)
//        url = try container.decode(String.self, forKey: .url)
//        urlToImage = try container.decode(String.self, forKey: .urlToImage)
//        publishedAt = try container.decode(String.self, forKey: .publishedAt)
//        content = try container.decode(String.self, forKey: .content)
//    }
//}

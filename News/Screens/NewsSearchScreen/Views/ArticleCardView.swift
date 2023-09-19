//
//  ArticleCard.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 19..
//

import SwiftUI

struct ArticleCardView: View {
    @Binding var article: Article
    
    func handleLongString(_ text: String, maxLength: Int) -> String {
            if text.count <= maxLength {
                return text
            } else {
                let endIndex = text.index(text.startIndex, offsetBy: maxLength)
                let editedText = text[..<endIndex]
                if let lastWhitespace = editedText.rangeOfCharacter(from: .whitespaces, options: .backwards)?.upperBound {
                    return String(editedText[..<lastWhitespace] + "...")
                } else {
                    return String(editedText+"...")
                }
            }
        }
        
    var body: some View {
        VStack {
            if let title = article.title {
                Text(handleLongString(title, maxLength: 50))
                    .font(.title)
                    .foregroundColor(Theme.orange.accentColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            if let description = article.description {
                Text(handleLongString(description, maxLength: 150))
                    .font(.caption)
                    .foregroundColor(Theme.orange.accentColor)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(6.0)
        .background(Color.white)
        .cornerRadius(16.0)
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(article: .constant(SearchResult.sampleData.articles[0]))
    }
}

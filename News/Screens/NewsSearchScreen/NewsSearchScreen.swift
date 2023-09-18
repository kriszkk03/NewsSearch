//
//  NewsSearchScreen.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 18..
//

import SwiftUI

struct NewsSearchScreen: View {
    var body: some View {
        VStack {
            SearchPageTitle()
            ZStack {
                RoundedRectangle(cornerRadius: 16.0)
                    .fill(.orange)
                SearchBar()
            }
        }
        .padding()
    }
}

struct NewsSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsSearchScreen()
    }
}

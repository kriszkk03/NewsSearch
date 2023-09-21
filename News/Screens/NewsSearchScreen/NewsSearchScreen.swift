//
//  NewsSearchScreen.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 18..
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct NewsSearchScreen: View {
    @State private var searchResults: [Article] = []
    @State private var searchText: String = ""
    
    @ObservedObject var userAuthModel: UserAuthModel


    var body: some View {
        NavigationStack {
            
            VStack {
                PageTitle(userAuthModel: userAuthModel)
                ZStack {
                    RoundedRectangle(cornerRadius: 4.0)
                        .fill(Theme.orange.mainColor)
                    VStack {
                        SearchBar(searchText: $searchText, searchResults: $searchResults)
                            .padding(.vertical)
                        if searchResults.count > 0 {
                            ArticlesListView(searchText: $searchText, searchResults: $searchResults)
                        }
                    }
                    .toolbar {
                            if userAuthModel.isLoggedIn == false {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    GoogleSignInButton(action: userAuthModel.handleSignInButton)
                                }
                            } else {
                                ToolbarItem(placement: .navigationBarLeading) {
                                    AuthFlowContentView(userAuthModel: userAuthModel)
                                }
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button(action: userAuthModel.signOut) {
                                        Text("Log out")
                                    }
                                    .padding(5.0)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                                }
                            }
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct NewsSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsSearchScreen(userAuthModel: .init())
    }
}

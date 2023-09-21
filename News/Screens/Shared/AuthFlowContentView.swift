//
//  AuthFlowContentView.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 20..
//

import SwiftUI

struct AuthFlowContentView: View {
    @ObservedObject var userAuthModel: UserAuthModel
    
    var body: some View {
        HStack {
            Menu {
                Section("User data") {
                    if(userAuthModel.isLoggedIn) {
                        Text("Name: \n\(userAuthModel.givenName)")
                            .multilineTextAlignment(.leading)
                        Text("Email: \n\(userAuthModel.givenEmail)")
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("Guest user")
                    }
                }
    //            Button {
    //                // Add this item to a list of favorites.
    //            } label: {
    //                Label("Add to Favorites", systemImage: "heart")
    //            }
    //
    //            Divider()
    //
    //            Button(role: .destructive) {
    //            } label: {
    //                Label("Delete", systemImage: "trash")
    //            }
            } label: {
                Label("Profile", systemImage: "person.circle.fill")
            }
        }
    }
}

struct AuthFlowContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthFlowContentView(userAuthModel: .init())
    }
}

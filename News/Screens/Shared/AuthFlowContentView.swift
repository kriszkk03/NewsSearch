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
        HStack(spacing: 0.0) {
            AsyncImage(url: URL(string: userAuthModel.profilePicUrl)) { image in
                if let img = image.image {
                    img
                        .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .padding(.horizontal, 5)
                            .clipShape(Circle())
                }
            }
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
                Text("Profile")
            }
        }
    }
}

struct AuthFlowContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthFlowContentView(userAuthModel: .init())
    }
}

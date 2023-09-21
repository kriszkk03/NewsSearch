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
            Menu {
                Section("User data") {
                    Text("Name: \n\(userAuthModel.givenName)")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Text("Email: \n\(userAuthModel.givenEmail)")
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }
            } label: {
                HStack {
                    AsyncImage(url: URL(string: userAuthModel.profilePicUrl)) { image in
                        if let img = image.image {
                            img
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                

                        }
                    }
                    .frame(width: 25, height: 25)
                    .padding(.leading, 5)
                    Text("Profile")
                        .foregroundColor(.black)
                }
            }

        }
}

struct AuthFlowContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthFlowContentView(userAuthModel: .init())
    }
}

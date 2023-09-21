//
//  NewsApp.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 17..
//

import SwiftUI
import GoogleSignIn

// Project name: News
// Product name: News APP
// Oauth client-id: 220744142168-noqsi5pi35o37fo8eg63ftkk11ovcdd9.apps.googleusercontent.com
// reversed client-id: com.googleusercontent.apps.220744142168-noqsi5pi35o37fo8eg63ftkk11ovcdd9

@main
struct NewsApp: App {
    @ObservedObject var userAuthModel: UserAuthModel
    
    init() {
        self.userAuthModel = .init()
        userAuthModel.checkStatus()
    }
    
    var body: some Scene {
        WindowGroup {
            VStack {
                NewsSearchScreen(userAuthModel: userAuthModel)
                    .onOpenURL { url in
                              GIDSignIn.sharedInstance.handle(url)
                    }
                    .onAppear {
                        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        }
                    }
            }
            
        }
    }
}


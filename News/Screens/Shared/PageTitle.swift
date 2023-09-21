//
//  SearchPageTitle.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 18..
//

import SwiftUI

struct PageTitle: View {
    @ObservedObject var userAuthModel: UserAuthModel
    var body: some View {
            Text("Best News App")
                .font(.system(size: 30, weight: .heavy))
                .frame(maxWidth: .infinity, alignment: .center)
        }
}

struct PageTitle_Previews: PreviewProvider {
    static var previews: some View {
        PageTitle(userAuthModel: .init())
    }
}

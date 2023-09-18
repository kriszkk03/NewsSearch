//
//  Theme.swift
//  News
//
//  Created by Tóth Krisztián on 2023. 09. 18..
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case indigo
    case magenta
    case orange
    case poppy
    case purple
    case yellow
    
    var accentColor: Color {
        switch self {
        case .orange, .poppy, .yellow: return .black
        case .indigo, .magenta, .purple: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}

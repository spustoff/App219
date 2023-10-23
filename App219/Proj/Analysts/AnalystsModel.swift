//
//  AnalystsModel.swift
//  App219
//
//  Created by IGOR on 16/10/2023.
//

import SwiftUI

struct AnalystsModel: Identifiable {
    
    var id = UUID().uuidString
    
    let name: String
    let time_ago: String
    let title: String
    let text: String
}

enum FavoritesType {

    case like, dislike, archive
}

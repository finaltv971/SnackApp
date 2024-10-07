//
//  Category.swift
//  SnackApp
//
//  Created by Anthony Baucal on 29/09/2024.
//

import Foundation

enum Category: Int,CaseIterable,Identifiable,Decodable{
    case all
    case bonbon
    case biscuit
    case gateau
    
    var image: String {
        switch self {
        case .all: return "Tous"
        case .bonbon: return "Bonbon"
        case .biscuit: return "Biscuits"
        case .gateau: return "Gateau"
        }
    }
    var nom: String {
        switch self {
        case .all: return "Tous"
        case .bonbon: return "Bonbon"
        case .biscuit: return "Biscuits"
        case .gateau: return "Gateau"
        }
    }
    

    var id: Int {
        return self.rawValue
    }
}



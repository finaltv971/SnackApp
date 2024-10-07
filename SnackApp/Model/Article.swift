//
//  Article.swift
//  SnackApp
//
//  Created by Anthony Baucal on 29/09/2024.
//
import Foundation
import SwiftUI

struct Article: Identifiable, Hashable, Decodable {
    
    init(id: String = UUID().uuidString, nom: String, category: Category, image: String, colorName: String, prix: Int) {
        self.id = id
        self.nom = nom
        self.category = category
        self.image = image
        self.colorName = colorName
        self.prix = prix
    }
    
    var id = UUID().uuidString
    var nom: String
    var category: Category
    var image: String
    var colorName: String
    var prix: Int
    
    // Propriété calculée pour obtenir la couleur à partir du nom
    var color: Color {
        switch colorName.lowercased() {
        case "black":
            return .black
        case "yellow":
            return .yellow
        case "red":
            return .red
        case "blue":
            return .blue
        default:
            return .clear
        }
    }
}

var listArticles: [Article] = [
    Article(nom: "Blue Pasta", category: Category.bonbon, image: "Bonbon", colorName: "black", prix: 10),
    Article(nom: "Gateau", category: Category.gateau, image: "Gateau", colorName: "yellow", prix: 15),
    Article(nom: "Biscuits", category: Category.biscuit, image: "Biscuits", colorName: "red", prix: 12),
    Article(nom: "Gateau", category: Category.gateau, image: "Gateau", colorName: "blue", prix: 12)
]

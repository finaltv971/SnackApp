//
//  GestionnairePanier.swift
//  SnackApp
//
//  Created by Anthony Baucal on 07/10/2024.
//

import Foundation

class GestionnairePanier : ObservableObject {
    @Published var panier : [Article] = []
    @Published var fraisLivraison : Float

    init() {
        self.panier = []
        self.fraisLivraison = 4.99
    }
    
    func ajouter(article:Article) {
        self.panier.append(article)
    }
    
    func supprimer(index:Int) {
        self.panier.remove(at: index)
    }
    
    func vider() {
        self.panier.removeAll()
    }
    
    func montantPanier() -> String {
        if (self.panier.isEmpty){
            return "0.00"
        }
        return String(format: "%.2f",Float(self.panier.map(\..prix).reduce(0,+)) + self.fraisLivraison)
    }
}

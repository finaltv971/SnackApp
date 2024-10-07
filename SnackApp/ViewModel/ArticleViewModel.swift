//
//  ArticleViewModel.swift
//  SnackApp
//
//  Created by Anthony Baucal on 29/09/2024.
//

import Foundation

@Observable
class ArticleViewModel {

    private let services: ArticleService?
    var listArticle: [Article] = []
    var cplistArticle: [Article] = []
    var categoryRecherche: Category?
    let strUrl = ""
    
    init(services: ArticleService){
        self.services = services
    }

    var filtreArticle: [Article] {
         if categoryRecherche == .all {
             return listArticle
         } else {
             return listArticle.filter { $0.category == categoryRecherche }
         }
     }

    func getArticle() async {
        do{
            let articles = try await services?.fetchArticle(strUrl: strUrl)
            
            DispatchQueue.main.async{
                self.listArticle = articles ?? []
                self.cplistArticle = articles ?? []
            }
        }catch{
            print(error)
        }
    }

}

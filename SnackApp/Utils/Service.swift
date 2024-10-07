//
//  Service.swift
//  SnackApp
//
//  Created by Anthony Baucal on 29/09/2024.
//

import Foundation


class ArticleService{
    
    func fetchArticle(strUrl: String) async throws -> [Article]{
        let url = URL(string: strUrl)

        guard let url = url else {
            fatalError()
        }

        
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
        }
            
        let decoder = JSONDecoder()
        return  try decoder.decode([Article].self, from: data)
    }
}


//
//  ArticleCardPanier.swift
//  SnackApp
//
//  Created by Anthony Baucal on 07/10/2024.
//

import SwiftUI

struct ArticleCardPanier: View {
    let item: Article
    

    var body: some View {
        HStack(alignment: .center,spacing: 20){
            Image(item.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            
            VStack (alignment: .leading){
                Text("\(item.nom)")
                    .font(.headline)
                    .fontWeight(.semibold)
                    
                Text("\(item.category)")
                    .font(.callout)
                    .opacity(0.5)
            }
            
            Spacer()
            
            Text("\(item.prix) €")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
                
        }
    }
}

#Preview {
    var item: [Article] = [
        Article(
            nom: "Bonbon",
            category: Category.bonbon,
            image: "Bonbon",
            colorName: "black",
            prix: 10)
    ]
    ArticleCardPanier(item:item[0])
}

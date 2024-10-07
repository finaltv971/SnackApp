//
//  ArticleCardView.swift
//  SnackApp
//
//  Created by Anthony Baucal on 06/10/2024.
//

import SwiftUI

struct ArticleCardView: View {
    var item: Article
    @EnvironmentObject var gestionnairePanier: GestionnairePanier

    var body: some View {
        ZStack{
            
            ZStack{
                
                VStack(alignment: .leading, content: {
                    
                    Text("\(item.nom)")
                        .font(.system(size: 36,weight: .bold))
                        .frame(width: 130)
                    
                    Text("\(item.category)")
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.8))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack{
                        Text("\(item.prix ) €")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button{
                            
                            gestionnairePanier.ajouter(article: item)
                            
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90,height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundStyle(.white)
                            
                        }
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.8))
                    .clipShape(Capsule())
                })
            }
            .padding(32)
            .frame(width: 336,height: 422)
            
        }
        .background(Image(item.image)
            .resizable()
            .scaledToFill()
        )
        .background(item.color.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .padding(.trailing,20)
        
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
    
    ArticleCardView(item:item[0])
        .environmentObject(GestionnairePanier())
}

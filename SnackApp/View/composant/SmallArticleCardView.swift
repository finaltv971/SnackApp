//
//  SmallArticleCardView.swift
//  SnackApp
//
//  Created by Anthony Baucal on 07/10/2024.
//

import SwiftUI

struct SmallArticleCardView: View {
    var item: Article
    @EnvironmentObject var gestionnairePanier: GestionnairePanier

    var body: some View {
        ZStack {

            ZStack {

                VStack(
                    alignment: .leading,
                    content: {

                        Text("\(item.nom)")
                            .font(.system(size: 18, weight: .semibold))
                            .frame(width: 70)

                        Text("\(item.category)")
                            .font(.system(size: 14))
                            .padding()
                            .background(.white.opacity(0.7))
                            .clipShape(Capsule())

                        Spacer()

                        HStack {
                            Text("\(item.prix ) €")
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()

                            Button {
                                gestionnairePanier.ajouter(article: item)
                            } label: {
                                Image(systemName: "basket")
                                    .imageScale(.large)
                                    .frame(width: 48, height: 40)
                                    .background(.black)
                                    .clipShape(Capsule())
                                    .foregroundStyle(.white)

                            }
                        }

                        .padding(.trailing, -12)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(.white.opacity(0.8))
                        .clipShape(Capsule())
                    })
            }
            .padding(20)
            .frame(width: 170, height: 215)

        }
        .frame(width: 170, height: 215)
        .background(
            Image(item.image)
                .resizable()
                .scaledToFill()
        )
        .background(item.color.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.leading, 10)
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

    SmallArticleCardView(item: item[0])
        .environmentObject(GestionnairePanier())
}

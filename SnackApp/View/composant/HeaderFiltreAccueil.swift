//
//  HeaderFiltreAccueil.swift
//  SnackApp
//
//  Created by Anthony Baucal on 29/09/2024.
//

import SwiftUI

struct HeaderFiltreAccueil: View {
    @Binding var categorieSelectionner: Category?

    var body: some View {

        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Category.allCases) { item in
                        Button {
                            withAnimation(.snappy) {
                                categorieSelectionner = item
                                print("\(item.nom)")
                            }
                        } label: {

                            HStack {
                                Image(systemName: item.image)
                                Text(item.nom)
                            }.padding()
                                .background(
                                    categorieSelectionner == item
                                        ? .black : .gray.opacity(0.1)
                                )
                                .foregroundStyle(
                                    categorieSelectionner == item
                                        ? .white : .black
                                )
                                .clipShape(Capsule())
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var categorieSelectionner: Category? = .all

    HeaderFiltreAccueil(categorieSelectionner: $categorieSelectionner)
}

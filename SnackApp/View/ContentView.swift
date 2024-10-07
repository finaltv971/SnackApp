//
//  ContentView.swift
//  SnackApp
//
//  Created by Anthony Baucal on 07/10/2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject var gestionnairePanier = GestionnairePanier()
    @State private var enableToPanier = false

    var body: some View {
        NavigationView {

            ZStack(alignment: .bottom) {

                Accueil()
                    .environmentObject(gestionnairePanier)

                if !gestionnairePanier.panier.isEmpty {

                    NavigationLink(
                        destination: Panier()
                            .environmentObject(gestionnairePanier)
                    ) {
                        HStack(spacing: 30) {
                            VStack {
                                Text("\(gestionnairePanier.panier.count)")
                                    .font(.headline)
                            }
                            .padding()
                            .background(.yellow)
                            .clipShape(Circle())
                            .foregroundStyle(.white)

                            VStack(alignment: .leading) {
                                Text(" \(gestionnairePanier.montantPanier()) €")
                                    .font(.system(size: 18, weight: .semibold))

                            }

                            Spacer()

                            HStack {
                                ForEach(gestionnairePanier.panier, id: \.id) {
                                    article in
                                    Image(article.image)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(8)
                                        .frame(width: 48, height: 48)
                                        .background(.white)
                                        .clipShape(Circle())
                                        .padding(.leading, -60)
                                }
                            }
                        }
                        .frame(maxWidth: 300)
                        .padding(30)
                        .frame(width: .infinity, height: 80)
                        .background(.black)
                        .clipShape(Capsule())
                        .padding()
                        .foregroundStyle(.white)
                    }

                }
            }
        }
    }
}

#Preview {
    ContentView()
}

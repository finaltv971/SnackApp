//
//  Panier.swift
//  SnackApp
//
//  Created by Anthony Baucal on 07/10/2024.
//

import SwiftUI

struct Panier: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var gestionnairePanier: GestionnairePanier

    init() {

    }

    var body: some View {

        NavigationView {
            ScrollView {
                VStack {

                    HStack {
                        Text("Panier")
                            .font(.title)
                            .padding(.trailing)
                            .fontWeight(.bold)

                        Spacer()

                        Button {
                            gestionnairePanier.vider()
                        } label: {
                            Image(systemName: "trash")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 50, height: 80)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())

                        }
                        .foregroundStyle(.black)

                        Button {
                            presentationMode.wrappedValue.dismiss()

                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 50, height: 80)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke()
                                        .opacity(0.4)
                                )

                        }
                        .foregroundStyle(.black)
                    }.padding(.horizontal)

                    VStack(spacing: 20) {
                        ForEach(gestionnairePanier.panier, id: \.id) {
                            item in
                            ArticleCardPanier(item: item)

                        }
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading) {
                        HStack {
                            Text("Cout livraison")

                            Spacer()

                            Text(
                                " \(String(format:"%.2f",gestionnairePanier.fraisLivraison)) €"
                            )

                            .font(.system(size: 24, weight: .semibold))
                        }

                        Divider()

                        VStack(alignment: .leading) {
                            Text("Total commande")
                                .font(.system(size: 24))

                            Text("\(gestionnairePanier.montantPanier()) €")
                                .font(.system(size: 36, weight: .semibold))
                        }
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(.yellow.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding()

                    Button {

                    } label: {
                        Text("Payer")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
            }

            .navigationBarBackButtonHidden(true)
        }.onAppear {
            if gestionnairePanier.panier.isEmpty {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    Panier()
        .environmentObject(GestionnairePanier())
}

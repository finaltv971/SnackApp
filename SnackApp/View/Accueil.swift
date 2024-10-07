//
//  ContentView.swift
//  SnackApp
//
//  Created by Anthony Baucal on 29/09/2024.
//

import SwiftUI

struct Accueil: View {

    @State var categorieSelectionner: Category? = .all
    @EnvironmentObject var gestionnairePanier: GestionnairePanier

    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    VStack {
                        
                        HStack {
                            Text("Commander vos \n **Snack**")
                                .font(.title)
                                .padding(.trailing)
                            Spacer()
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 50, height: 80)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke()
                                        .opacity(0.4))
                            
                        }
                        .padding()
                        
                        HeaderFiltreAccueil(
                            categorieSelectionner: $categorieSelectionner
                        )
                        .ignoresSafeArea()
                        
                        HStack {
                            Text("Choco **Collection**")
                                .font(.system(size: 24))
                            
                            Spacer()
                            
                            NavigationLink {
                                CollectionView()
                                    .environmentObject(gestionnairePanier)
                            } label: {
                                Image(systemName: "arrow.right")
                                
                            }.foregroundStyle(Color.black)
                        }
                        .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(listArticles, id: \.id) { item in
                                    
                                    if (categorieSelectionner?.nom == "Tous" ){
                                        ArticleCardView(item: item)
                                            .environmentObject(gestionnairePanier)
                                    } else if item.category == categorieSelectionner
                                    {
                                        ArticleCardView(item: item)
                                            .environmentObject(gestionnairePanier)
                                    }
                                }
                            }
                        }
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    Accueil()
        .environmentObject(GestionnairePanier())
}

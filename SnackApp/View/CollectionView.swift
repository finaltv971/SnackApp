//
//  CollectionView.swift
//  SnackApp
//
//  Created by Anthony Baucal on 07/10/2024.
//

import SwiftUI

struct CollectionView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var gestionnairePanier: GestionnairePanier

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Commander vos \n **Snack**")
                            .font(.title)
                            .padding(.trailing)
                        Spacer()
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 50, height: 80)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke()
                                    .opacity(0.4)
                            )
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()

                            }

                    }
                    .padding()

                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                        ], alignment: .center,
                        content: {
                            ForEach(listArticles, id: \.id) {
                                item in
                                SmallArticleCardView(item: item)
                                    .environmentObject(gestionnairePanier)
                            }
                        }
                    ).padding(.horizontal)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CollectionView()
        .environmentObject(GestionnairePanier())
}

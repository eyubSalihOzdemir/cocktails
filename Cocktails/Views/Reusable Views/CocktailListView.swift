//
//  CocktailListView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 10.05.2023.
//

import SwiftUI

struct CocktailListView: View {
    @Binding var cocktailList: [Cocktail]
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    var showFavoriteIndicator: Bool = true
    
    var body: some View {
        if !cocktailList.isEmpty {
            ForEach(cocktailList, id: \.self) { cocktail in
                NavigationLink {
                    CocktailDetailsView(cocktail: cocktail)
                } label: {
                    HStack {
                        CacheAsyncImage(url: URL(string: cocktail.strDrinkThumb)!) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            } else if phase.error != nil {
                                EmptyView()
                            } else {
                                ProgressView()
                            }
                        }
                        .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(cocktail.strDrink)
                            Text(cocktail.strCategory)
                                .foregroundColor(.secondary)
                        }
                        
                        
                        if showFavoriteIndicator && favoritesViewModel.cocktails.contains(cocktail) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        } else {
            Text("No result for cocktails")
        }
    }
}

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListView(cocktailList: .constant([Cocktail.example]))
    }
}

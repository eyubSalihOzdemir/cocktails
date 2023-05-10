//
//  CocktailDetailsView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import SwiftUI

struct CocktailDetailsView: View {
    let cocktail: Cocktail
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        
        self._viewModel = StateObject(wrappedValue: ViewModel(cocktail: cocktail))
    }
        
    var body: some View {
        VStack {
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
            
            HStack {
                CocktailIngredientsView(cocktail: cocktail)
            }
            .padding()
            
            Text(cocktail.strInstructions)
        }
        .padding()
        .navigationTitle(cocktail.strDrink)
        .toolbar {
            ToolbarItem {
                Button {
                    if favoritesViewModel.cocktails.contains(cocktail) {
                        favoritesViewModel.removeCocktailFromFavorites(cocktail: cocktail)
                    } else {
                        favoritesViewModel.addCocktailToFavorites(cocktail: cocktail)
                    }
                } label: {
                    Image(systemName: favoritesViewModel.cocktails.contains(cocktail) ? "heart.fill" : "heart")
                }
            }
        }
    }
}

struct CocktailDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CocktailDetailsView(cocktail: Cocktail.example)
        }
        .environmentObject(FavoritesViewModel())
    }
}

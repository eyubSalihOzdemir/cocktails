//
//  FavoritesView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel

    var body: some View {
        NavigationView {
            List {
                Section("Cocktails") {
                    CocktailListView(cocktailList: filteredCocktails, showFavoriteIndicator: false)
                }
                .textCase(nil)
                
                Section("Ingredients") {
                    IngredientListView(ingredientList: filteredIngredients, showFavoriteIndicator: false)
                }
                .textCase(nil)
            }
            .navigationTitle("Favorites")
        }
        .searchable(text: $viewModel.searchText, prompt: "Search in favorites")
    }
    
    var filteredCocktails: [Cocktail] {
        if viewModel.searchText.isEmpty {
            return viewModel.cocktails
        } else {
            return viewModel.cocktails.filter { cocktail in
                cocktail.strDrink.localizedCaseInsensitiveContains(viewModel.searchText)
            }
        }
    }
    var filteredIngredients: [Ingredient] {
        if viewModel.searchText.isEmpty {
            return viewModel.ingredients
        } else {
            return viewModel.ingredients.filter { ingredient in
                ingredient.strIngredient.localizedCaseInsensitiveContains(viewModel.searchText)
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesViewModel())
    }
}

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
                    CocktailListView(cocktailList: $viewModel.cocktails)
                }
                .textCase(nil)
                
                Section("Ingredients") {
                    IngredientListView(ingredientList: $viewModel.ingredients)
                }
                .textCase(nil)
            }
            .navigationTitle("Favorites")
        }
        .searchable(text: $viewModel.searchText, prompt: "Search in favorites")
        
        // Implement the search for view feature!
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

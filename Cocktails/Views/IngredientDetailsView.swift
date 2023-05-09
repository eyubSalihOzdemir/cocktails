//
//  IngredientDetailsView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 9.05.2023.
//

import SwiftUI

struct IngredientDetailsView: View {
    let ingredient: Ingredient
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    init(ingredient: Ingredient) {
        self.ingredient = ingredient
        
        self._viewModel = StateObject(wrappedValue: ViewModel(ingredient: ingredient))
    }
    
    var body: some View {
        VStack {
            Text(ingredient.strDescription ?? "No description")
        }
        .padding()
        .navigationTitle(ingredient.strIngredient)
        .toolbar {
            ToolbarItem {
                Button {
                    if favoritesViewModel.ingredients.contains(ingredient) {
                        favoritesViewModel.removeIngredientFromFavorites(ingredient: ingredient)
                    } else {
                        favoritesViewModel.addIngredientToFavorite(ingredient: ingredient)
                    }
                } label: {
                    Image(systemName: favoritesViewModel.ingredients.contains(ingredient) ? "heart.fill" : "heart")
                }
            }
        }
    }
}

struct IngredientDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetailsView(ingredient: Ingredient.example)
    }
}

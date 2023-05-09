//
//  IngredientListView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 10.05.2023.
//

import SwiftUI

struct IngredientListView: View {
    @Binding var ingredientList: [Ingredient]
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    var showFavoriteIndicator: Bool = true
    
    var body: some View {
        if !ingredientList.isEmpty {
            ForEach(ingredientList, id: \.self) { ingredient in
                NavigationLink {
                    IngredientDetailsView(ingredient: ingredient)
                } label: {
                    HStack {
                        Text(ingredient.strIngredient)
                        
                        if showFavoriteIndicator && favoritesViewModel.ingredients.contains(ingredient) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        } else {
            Text("No result for ingredients")
        }
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView(ingredientList: .constant([Ingredient.example]))
    }
}

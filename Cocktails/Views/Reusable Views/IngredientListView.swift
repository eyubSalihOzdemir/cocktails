//
//  IngredientListView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 10.05.2023.
//

import SwiftUI

struct IngredientListView: View {
    var ingredientList: [Ingredient]
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    var showFavoriteIndicator: Bool = true
    
    var body: some View {
        if !ingredientList.isEmpty {
            ForEach(ingredientList, id: \.self) { ingredient in
                NavigationLink {
                    IngredientDetailsView(ingredient: ingredient)
                } label: {
                    HStack {
                        CacheAsyncImage(url: URL(string: "https://www.thecocktaildb.com/images/ingredients/\(ingredient.strIngredient.lowercased()).png")!) { phase in
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
        IngredientListView(ingredientList: [Ingredient.example])
    }
}

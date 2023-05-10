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
        ScrollView {
            VStack {
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
                
                HStack {
                    Text("Alcoholic:")
                        .font(.headline)
                    Text(ingredient.strAlcohol)
                    
                    if let abv = ingredient.strABV {
                        Text("ABV:")
                            .font(.headline)
                        Text("\(abv)%")
                    }
                }
                
                if let description = ingredient.strDescription {
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.headline)
                            .padding(.vertical, 5)
                        Text(description)
                    }
                }
                
                if let type = ingredient.strType {
                    HStack {
                        Text("Type:")
                            .font(.headline)
                        Text(type)
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .padding(.horizontal)
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
            .environmentObject(FavoritesViewModel())
    }
}

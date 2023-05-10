//
//  CocktailIngredientsView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 10.05.2023.
//

import SwiftUI

struct CocktailIngredientsView: View {
    let cocktail: Cocktail
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(cocktail.cocktailIngredients, id: \.self) { cocktailIngredient in
                VStack {
                    Text(cocktailIngredient.ingredient)
                        .font(.headline)
                        .lineLimit(1)

                    Text(cocktailIngredient.mesaure)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }
        }
    }
}

struct CocktailIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailIngredientsView(cocktail: Cocktail.example)
    }
}

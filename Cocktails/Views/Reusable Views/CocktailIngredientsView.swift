//
//  CocktailIngredientsView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 10.05.2023.
//

import SwiftUI

struct CocktailIngredientsView: View {
    let cocktail: Cocktail
    
    var body: some View {
        Group {
            ForEach(cocktail.cocktailIngredients, id: \.self) { cocktailIngredient in
                VStack {
                    Text(cocktailIngredient.ingredient)
                        .font(.headline)
                    
                    Text(cocktailIngredient.mesaure)
                        .foregroundColor(.secondary)
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

//
//  IngredientListView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 10.05.2023.
//

import SwiftUI

struct IngredientListView: View {
    @Binding var ingredientList: [Ingredient]
    
    var body: some View {
        if !ingredientList.isEmpty {
            ForEach(ingredientList, id: \.self) { ingredient in
                NavigationLink {
                    IngredientDetailsView(ingredient: ingredient)
                } label: {
                    Text(ingredient.strIngredient)
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

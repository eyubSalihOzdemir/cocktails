//
//  IngredientDetailsView-ViewModel.swift
//  Cocktails
//
//  Created by Salih Özdemir on 9.05.2023.
//

import Foundation

extension IngredientDetailsView {
    @MainActor class ViewModel: ObservableObject {
        var ingredient: Ingredient
        
        init(ingredient: Ingredient) {
            self.ingredient = ingredient
        }
    }
}

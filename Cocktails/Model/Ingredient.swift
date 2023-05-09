//
//  Ingredients.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import Foundation

struct IngredientResponse: Codable {
    var ingredients: [Ingredient]? = nil
}

struct Ingredient: Codable, Hashable, Equatable {
    var idIngredient: String
    var strIngredient: String
    var strDescription: String? = nil
    var strType: String? = nil
    var strAlcohol: String
    var strABV: String? = nil
    
    static func ==(lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.idIngredient == rhs.idIngredient
    }
    
    static let example: Ingredient = Ingredient(idIngredient: "12345", strIngredient: "Orange", strAlcohol: "No")
}

//
//  Cocktail.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import Foundation

struct CocktailResponse: Codable {
    var drinks: [Cocktail]? = nil
}

struct Cocktail: Codable, Hashable, Equatable {
    //var id: UUID
    var idDrink: String
    var strDrink: String
    var strDrinkAlternate: String? = nil
    var strTags: String? = nil
    var strVideo: String? = nil
    var strCategory: String
    var strIBA: String? = nil
    var strAlcoholic: String
    var strGlass: String
    var strInstructions: String
    var strInstructionsDE: String? = nil
    var strDrinkThumb: String
    var strIngredient1: String? = nil
    var strIngredient2: String? = nil
    var strIngredient3: String? = nil
    var strIngredient4: String? = nil
    var strIngredient5: String? = nil
    var strIngredient6: String? = nil
    var strIngredient7: String? = nil
    var strIngredient8: String? = nil
    var strIngredient9: String? = nil
    var strIngredient10: String? = nil
    var strIngredient11: String? = nil
    var strIngredient12: String? = nil
    var strIngredient13: String? = nil
    var strIngredient14: String? = nil
    var strIngredient15: String? = nil
    var strMeasure1: String? = nil
    var strMeasure2: String? = nil
    var strMeasure3: String? = nil
    var strMeasure4: String? = nil
    var strMeasure5: String? = nil
    var strMeasure6: String? = nil
    var strMeasure7: String? = nil
    var strMeasure8: String? = nil
    var strMeasure9: String? = nil
    var strMeasure10: String? = nil
    var strMeasure11: String? = nil
    var strMeasure12: String? = nil
    var strMeasure13: String? = nil
    var strMeasure14: String? = nil
    var strMeasure15: String? = nil
    var strImageSource: String? = nil
    var strDateModified: String? = nil
    
    var cocktailIngredients: [CocktailIngredient] {
        var cocktailIngredients = [CocktailIngredient]()
        
        if let ingredient = strIngredient1 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure1 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient2 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure2 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient3 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure3 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient4 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure4 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient5 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure5 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient6 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure6 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient7 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure7 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient8 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure8 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient9 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure9 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient10 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure10 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient11 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure11 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient12 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure12 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient13 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure13 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient14 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure14 ?? "No measure"
                )
            )
        }
        if let ingredient = strIngredient15 {
            cocktailIngredients.append(
                CocktailIngredient(
                    ingredient: ingredient,
                    mesaure: strMeasure15 ?? "No measure"
                )
            )
        }
        
        return cocktailIngredients
    }
    
    static func ==(lhs: Cocktail, rhs: Cocktail) -> Bool {
        return lhs.idDrink == rhs.idDrink
    }
    
    static let example: Cocktail = Cocktail(idDrink: "12345", strDrink: "Margarita", strTags: "IBA,ContemporaryClassic", strCategory: "Ordinary Drink", strAlcoholic: "Alcoholic", strGlass: "Cocktail glass", strInstructions: "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.", strInstructionsDE: "Reiben Sie den Rand des Glases mit der Limettenscheibe, damit das Salz daran haftet. Achten Sie darauf, dass nur der äußere Rand angefeuchtet wird und streuen Sie das Salz darauf. Das Salz sollte sich auf den Lippen des Genießers befinden und niemals in den Cocktail einmischen. Die anderen Zutaten mit Eis schütteln und vorsichtig in das Glas geben.", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg", strIngredient1: "Tequila", strIngredient2: "Triple sec", strIngredient3: "Lime juice", strIngredient4: "Salt", strMeasure1: "1 1/2 oz ", strMeasure2: "1/2 oz ", strMeasure3: "1 oz ", strImageSource: "https://commons.wikimedia.org/wiki/File:Klassiche_Margarita.jpg", strDateModified: "2015-08-18 14:42:59")
}

//
//  FavoritesView-ViewModel.swift
//  Cocktails
//
//  Created by Salih Özdemir on 9.05.2023.
//

import Foundation

@MainActor class FavoritesViewModel: ObservableObject {
    @Published var searchText = ""
    
    let cocktailsSavePath = FileManager.documentsDirectory.appendingPathExtension("FavoriteCocktails")
    let ingredientsSavePath = FileManager.documentsDirectory.appendingPathExtension("FavoriteIngredients")
    @Published var cocktails: [Cocktail]
    @Published var ingredients: [Ingredient]
    
    init() {
        do {
            let cocktailData = try Data(contentsOf: cocktailsSavePath)
            cocktails = try JSONDecoder().decode([Cocktail].self, from: cocktailData)
        } catch {
            cocktails = []
        }
        
        do {
            let ingredientData = try Data(contentsOf: ingredientsSavePath)
            ingredients = try JSONDecoder().decode([Ingredient].self, from: ingredientData)
        } catch {
            ingredients = []
        }
    }
    
    func addCocktailToFavorites(cocktail: Cocktail) {
        if self.cocktails.contains(cocktail) {
            print("Cocktail is already in favorites!")
        } else {
            //objectWillChange.send()
            cocktails.append(cocktail)
            saveCocktails()
        }
    }
    
    func removeCocktailFromFavorites(cocktail: Cocktail) {
        cocktails.removeAll { element in
            cocktail == element
        }
        saveCocktails()
    }
    
    func saveCocktails() {
        do {
            let data = try JSONEncoder().encode(cocktails)
            try data.write(to: cocktailsSavePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error: Unable to save data cocktails!")
        }
    }
    
    func addIngredientToFavorite(ingredient: Ingredient) {
        if self.ingredients.contains(ingredient) {
            print("Ingredient is already in favorites!")
        } else {
            //objectWillChange.send()
            ingredients.append(ingredient)
            saveIngredients()
        }
    }
    
    func removeIngredientFromFavorites(ingredient: Ingredient) {
        ingredients.removeAll { element in
            ingredient == element
        }
        saveIngredients()
    }
    
    func saveIngredients() {
        do {
            let data = try JSONEncoder().encode(ingredients)
            try data.write(to: ingredientsSavePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error: Unable to save data for ingredients!")
        }
    }
}

//
//  CocktailSearchView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import SwiftUI

enum LoadingState {
    case loading, loaded, failed
}

struct CocktailSearchView: View {
    @State private var searchText = ""
    
    @State private var cocktailList = [Cocktail]()
    @State private var ingredientList = [Ingredient]()
    
    @State private var loadingState: LoadingState = .loaded
    
    private var welcomeText = "Search for cocktails and ingredients"
    @State private var isShowingWelcomeText = true
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Group {
                switch loadingState {
                case .loading:
                    ProgressView()
                case .loaded:
                    if isShowingWelcomeText {
                        Text(welcomeText)
                    } else {
                        List {
                            Section("Cocktails") {
                                CocktailListView(cocktailList: cocktailList)
                            }
                            .textCase(nil)
                            
                            Section("Ingredients") {
                                IngredientListView(ingredientList: ingredientList)
                            }
                            .textCase(nil)
                        }
                    }
                case .failed:
                    Text("There was an error. Please try again later.")
                }
            }
            .navigationTitle("Search Cocktails")
        }
        .searchable(text: $searchText, prompt: "Search by cocktail or ingredient name")
        .onSubmit(of: .search) {
            Task { @MainActor in
                await searchForCocktails()
            }
        }
        .alert("There was an error", isPresented: $showingAlert) {
            Text("Please try again later.")
        }
    }
    
    func searchForCocktails() async {
        loadingState = .loading
        
        let formattedSearchText = searchText.folding(options: .diacriticInsensitive, locale: Locale(identifier: "en")).lowercased()
        
        let urlCocktailSearchString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(formattedSearchText)"
        let urlIngredientSearchString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?i=\(formattedSearchText)"
        
        guard let cocktailUrl = URL(string: urlCocktailSearchString), let ingredientUrl = URL(string: urlIngredientSearchString) else {
            print("Bad URL. Could not be converted.")
            loadingState = .failed
            return
        }
        
        do {
            let (cocktailData, _) = try await URLSession.shared.data(from: cocktailUrl)
            let (ingredientData, _) = try await URLSession.shared.data(from: ingredientUrl)
            
            let cocktailResponse = try JSONDecoder().decode(CocktailResponse.self, from: cocktailData)
            let ingredientResponse = try JSONDecoder().decode(IngredientResponse.self, from: ingredientData)
            
            cocktailList = cocktailResponse.drinks ?? []
            ingredientList = ingredientResponse.ingredients ?? []
            ingredientList = ingredientList.filter { ingredient in
                if ingredient.strDescription == nil {
                    return false
                } else {
                    return true
                }
            }
            
            isShowingWelcomeText = false
            loadingState = .loaded
        } catch {
            print("\(error)")
            
            loadingState = .failed
            showingAlert = true
        }
    }
}

struct CocktailSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailSearchView()
    }
}

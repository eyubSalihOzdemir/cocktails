//
//  CocktailSearchView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import SwiftUI

struct CocktailSearchView: View {
    @State private var searchText = ""
    @State private var cocktailList = [Cocktail]()
    
    var body: some View {
        NavigationView {
            Group {
                if !cocktailList.isEmpty {
                    List(cocktailList) { cocktail in
                        Text(cocktail.strDrink)
                    }
                } else {
                    Text("Search for cocktails...")
                        
                }
            }
            .navigationTitle("Search Cocktails")
                
        }
        .searchable(text: $searchText, prompt: "Search cocktails by name or ingredient")
        .onSubmit(of: .search) {
            // do the search
        }
    }
    
    func searchForCocktails() async {
        let url = ""
    }
}

struct CocktailSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailSearchView()
    }
}

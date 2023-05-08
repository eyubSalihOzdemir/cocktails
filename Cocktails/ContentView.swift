//
//  ContentView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            CocktailSearchView()
                .tabItem {
                    Label("Search Cocktails", systemImage: "magnifyingglass")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

//
//  CocktailsApp.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import SwiftUI

@main
struct CocktailsApp: App {
    @StateObject var favoritesViewModel = FavoritesViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesViewModel)
        }
    }
}

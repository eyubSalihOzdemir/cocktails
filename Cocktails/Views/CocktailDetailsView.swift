//
//  CocktailDetailsView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import SwiftUI

struct CocktailDetailsView: View {
    let cocktail: Cocktail
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    @State private var backgroundColor: Color = .clear
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        
        self._viewModel = StateObject(wrappedValue: ViewModel(cocktail: cocktail))
    }
        
    var body: some View {
        ScrollView {
            VStack {
                CacheAsyncImage(url: URL(string: cocktail.strDrinkThumb)!) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    } else if phase.error != nil {
                        EmptyView()
                    } else {
                        ProgressView()
                    }
                }
                
                CocktailIngredientsView(cocktail: cocktail)
                    .padding(.vertical, 5)
                    .background(.secondary.opacity(0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                HStack {
                    Text(cocktail.strAlcoholic)
                    Text(cocktail.strCategory)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Instructions")
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.vertical, 5)
                    Text(cocktail.strInstructions)
                }
                
                HStack {
                    Text("Glass type:")
                        .font(.headline)
                    Text(cocktail.strGlass)
                    Spacer()
                }
                .padding(.vertical, 5)
                
                if let iba = cocktail.strIBA {
                    HStack {
                        Text("IBA Category:")
                            .font(.headline)
                        Text(iba)
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                
                if let tags = cocktail.strTags {
                    HStack(alignment: .top) {
                        Text("Tags:")
                            .font(.headline)
                        Text(tags)
                        Spacer()
                    }
                    .padding(.vertical, 5)
                }
                
                if let alternate = cocktail.strDrinkAlternate {
                    HStack {
                        Text("Alternative: ")
                            .font(.headline)
                        Text(alternate)
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal)
        .navigationTitle(cocktail.strDrink)
        .toolbar {
            ToolbarItem {
                Button {
                    if favoritesViewModel.cocktails.contains(cocktail) {
                        favoritesViewModel.removeCocktailFromFavorites(cocktail: cocktail)
                    } else {
                        favoritesViewModel.addCocktailToFavorites(cocktail: cocktail)
                    }
                } label: {
                    Image(systemName: favoritesViewModel.cocktails.contains(cocktail) ? "heart.fill" : "heart")
                }
            }
        }
    }
}

struct CocktailDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CocktailDetailsView(cocktail: Cocktail.example)
        }
        .environmentObject(FavoritesViewModel())
    }
}

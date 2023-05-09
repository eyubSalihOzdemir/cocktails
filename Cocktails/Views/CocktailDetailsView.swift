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
    
    init(cocktail: Cocktail) {
        self.cocktail = cocktail
        
        self._viewModel = StateObject(wrappedValue: ViewModel(cocktail: cocktail))
    }
        
    var body: some View {
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
            
            Button {
                favoritesViewModel.addCocktailToFavorites(cocktail: cocktail)
            } label: {
                Text("Favorite")
            }
            .padding()
            .foregroundColor(.white)
            .background(.orange)
            .clipShape(Capsule())
        }
        .navigationTitle(cocktail.strDrink)
    }
}

struct CocktailDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CocktailDetailsView(cocktail: Cocktail.example)
        }
    }
}

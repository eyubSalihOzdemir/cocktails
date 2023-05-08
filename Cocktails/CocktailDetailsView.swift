//
//  CocktailDetailsView.swift
//  Cocktails
//
//  Created by Salih Özdemir on 8.05.2023.
//

import SwiftUI

struct CocktailDetailsView: View {
    let cocktail: Cocktail
    
    var body: some View {
        Text("Cocktail details")
    }
}

struct CocktailDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailsView(cocktail: Cocktail.example)
    }
}

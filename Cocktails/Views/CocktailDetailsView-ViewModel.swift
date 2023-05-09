//
//  CocktailDetailsView-ViewModel.swift
//  Cocktails
//
//  Created by Salih Özdemir on 9.05.2023.
//

import Foundation
import SwiftUI

extension CocktailDetailsView {
    @MainActor class ViewModel: ObservableObject {
        var cocktail: Cocktail
        
        init(cocktail: Cocktail) {
            self.cocktail = cocktail
        }
    }
}

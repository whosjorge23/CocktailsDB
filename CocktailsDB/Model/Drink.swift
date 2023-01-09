//
//  Drink.swift
//  CocktailsDB
//
//  Created by Giorgio Giannotta on 09/01/23.
//

import Foundation

// MARK: - Drink
struct Drink: Codable {
    let drinks: [DrinkElement]
}

// MARK: - DrinkElement
struct DrinkElement: Codable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}
